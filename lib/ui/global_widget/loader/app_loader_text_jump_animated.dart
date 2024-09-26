import 'package:admin_clinica_front/common/constants/app_const_colors.dart';

import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';

class AppLoaderTextJumpAnimate extends StatefulWidget {
  const AppLoaderTextJumpAnimate({
    required this.heightJump,
    required this.message,
    required this.buildText,
    super.key,
  });
  final String message;
  final double heightJump;
  final Widget Function(String) buildText;

  @override
  State<AppLoaderTextJumpAnimate> createState() => _AppLoaderTextJumpAnimateState();
}

class _AppLoaderTextJumpAnimateState extends State<AppLoaderTextJumpAnimate> with TickerProviderStateMixin {
  late AnimationController _controllerTextWait;
  late AnimationController _controllerTextWritting;
  late List<Animation<double>> _charAnimations;
  @override
  void initState() {
    super.initState();

    _controllerTextWait = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controllerTextWritting = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _charAnimations = List.generate(
      widget.message.length,
      (index) {
        final startInterval = (index * 2) / (widget.message.length * 2);
        // final midInterval = ((index * 2) + 1) / (widget.message.length * 2);
        final endInterval = ((index + 1) * 2) / (widget.message.length * 2);
        return TweenSequence([
          TweenSequenceItem(
            tween: Tween(begin: 0.0, end: -widget.heightJump).chain(CurveTween(curve: Curves.easeOut)),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(begin: -widget.heightJump, end: 0.0).chain(CurveTween(curve: Curves.easeIn)),
            weight: 50,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controllerTextWait,
            curve: Interval(startInterval, endInterval),
          ),
        );
      },
    );

    _controllerTextWritting.addListener(() {
      if (_controllerTextWritting.status == AnimationStatus.completed) {
        _controllerTextWait.forward(from: 0);
      }
    });

    _controllerTextWait.addListener(() {
      if (_controllerTextWait.status == AnimationStatus.completed) {
        _controllerTextWritting.forward(from: 0);
      }
    });

    _controllerTextWritting.forward();
  }

  @override
  void dispose() {
    _controllerTextWritting.dispose();
    _controllerTextWait.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controllerTextWait,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.message.length, (index) {
            return Transform.translate(
              offset: Offset(0, _charAnimations[index].value),
              child: widget.buildText(widget.message[index]),
            );
          }),
        );
      },
    );
  }
}

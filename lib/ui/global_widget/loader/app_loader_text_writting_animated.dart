import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';

class AppLoaderTextWritingAnimate extends StatefulWidget {
  const AppLoaderTextWritingAnimate({
    required this.message,
    required this.buildText,
    super.key,
  });
  final String message;
  final Widget Function(String) buildText;

  @override
  State<AppLoaderTextWritingAnimate> createState() => _AppLoaderTextWritingAnimateState();
}

class _AppLoaderTextWritingAnimateState extends State<AppLoaderTextWritingAnimate> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controllerText;
  late AnimationController _controllerTextWait;
  late AnimationController _controllerTextWritting;

  late Animation<int> _characterCount;
  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controllerText = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controllerTextWait = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controllerTextWritting = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _characterCount = StepTween(
      begin: 0,
      end: widget.message.length,
    ).animate(_controllerTextWritting);
    _controller1.addListener(() {
      if (_controller1.status == AnimationStatus.completed) {
        _controller1.forward(from: 0);
      }
    });

    _controllerText.addListener(() {
      if (_controllerText.status == AnimationStatus.completed) {
        _controllerText.forward(from: 0);
      }
    });

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

    _controller1.forward();
    _controllerText.forward();
    _controllerTextWritting.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controllerText.dispose();
    _controllerTextWritting.dispose();
    _controllerTextWait.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controllerTextWritting,
          builder: (context, child) {
            return widget.buildText(widget.message.substring(0, _characterCount.value) + (_characterCount.value == widget.message.length ? '' : '...'));
            return AppTextGlobal.mediumText(text: widget.message.substring(0, _characterCount.value) + (_characterCount.value == widget.message.length ? '' : '...'), fontWeight: FontWeight.bold);
          },
        ),
      ],
    );
  }
}

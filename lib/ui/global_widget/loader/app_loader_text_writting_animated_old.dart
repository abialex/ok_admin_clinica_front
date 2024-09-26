import 'package:admin_clinica_front/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class AppLoaderTextWritingAnimateoLD extends StatefulWidget {
  const AppLoaderTextWritingAnimateoLD({
    required this.message,
    this.iconLeft = const Icon(Icons.phone_android_rounded, size: 35),
    this.iconRight = const Icon(Icons.wordpress_outlined, size: 35),
    this.iconFloating = const Icon(Icons.receipt_outlined, size: 25),
    this.sizeCenterIcon = 50,
    super.key,
  });
  final String message;
  final Widget iconLeft;
  final Widget iconRight;
  final Widget iconFloating;
  final double sizeCenterIcon;

  @override
  State<AppLoaderTextWritingAnimateoLD> createState() => _AppLoaderTextWritingAnimateoLDState();
}

class _AppLoaderTextWritingAnimateoLDState extends State<AppLoaderTextWritingAnimateoLD> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controllerText;
  late AnimationController _controllerTextWait;
  late AnimationController _controllerTextWritting;
  late Animation<double> _animatedEjeX;
  late Animation<double> _animatedEjeYForward;
  late Animation<double> _animatedEjeYBack;
  late Animation<double> _animatedOpacityForward;
  late Animation<double> _animatedOpacityBack;
  late Animation<int> _characterCount;
  late List<Animation<double>> _charAnimations;
  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controllerText = AnimationController(
      duration: const Duration(seconds: 5),
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

    _charAnimations = List.generate(
      widget.message.length,
      (index) {
        final startInterval = (index * 2) / (widget.message.length * 2);
        // final midInterval = ((index * 2) + 1) / (widget.message.length * 2);
        final endInterval = ((index + 1) * 2) / (widget.message.length * 2);
        return TweenSequence([
          TweenSequenceItem(
            tween: Tween(begin: 0.0, end: -10.0).chain(CurveTween(curve: Curves.easeOut)),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(begin: -10.0, end: 0.0).chain(CurveTween(curve: Curves.easeIn)),
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

    _animatedOpacityForward = CurveTween(
      curve: const Interval(0, 0.2),
    ).animate(_controller1);

    _animatedOpacityBack = CurveTween(
      curve: const Interval(0.8, 1),
    ).animate(_controller1);
    _animatedEjeX = CurveTween(
      curve: const Interval(0.2, 0.8),
    ).animate(_controller1);

    _animatedEjeYForward = CurveTween(
      curve: const Interval(0.2, 0.5, curve: Curves.decelerate),
    ).animate(_controller1);

    _animatedEjeYBack = CurveTween(
      curve: const Interval(0.5, 0.8, curve: Curves.easeIn),
    ).animate(_controller1);

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
    var progress = 0.0;
    var positionX = 0.0;
    var positionY = 0.0;
    var rotate = 0.0;
    var opacity = 0.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          // padding: const EdgeInsets.symmetric(horizontal: 0),
          color: AppConstColors.dark.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      widget.iconLeft,
                      const Expanded(child: SizedBox.shrink()),
                      widget.iconRight,
                    ],
                  ),
                  Positioned(
                    child: AnimatedBuilder(
                      animation: _controller1,
                      builder: (context, child) {
                        positionX = _animatedEjeX.value * (constraints.maxWidth - 50) + 10;
                        positionY = -(_animatedEjeYForward.value - _animatedEjeYBack.value) * constraints.maxHeight / 8 + -20;
                        rotate = _animatedEjeX.value * 10;
                        opacity = _animatedOpacityForward.value - _animatedOpacityBack.value;

                        return Transform.translate(
                          offset: Offset(positionX, positionY),
                          child: Transform.rotate(
                            angle: rotate,
                            child: Opacity(
                              opacity: opacity.clamp(0, 1),
                              child: widget.iconFloating,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: AnimatedBuilder(
                      animation: _controllerText,
                      builder: (context, child) {
                        progress = _controllerText.value;
                        return AnimatedSwitcher(
                          duration: 0.5.seconds,
                          child: () {
                            if (progress < 0.15) {
                              return SvgPicture.asset(
                                AppConstSvgs.construccion_worker,
                                height: widget.sizeCenterIcon,
                              );
                            } else if (progress < 0.35) {
                              return SvgPicture.asset(
                                AppConstSvgs.state_pendiente,
                                height: widget.sizeCenterIcon,
                              );
                            } else if (progress < 0.55) {
                              return SvgPicture.asset(
                                AppConstSvgs.state_confirmado,
                                height: widget.sizeCenterIcon,
                              );
                            } else if (progress < 0.75) {
                              return SvgPicture.asset(
                                AppConstSvgs.state_atendiendo,
                                height: widget.sizeCenterIcon,
                              );
                            } else {
                              return SizedBox(
                                child: SvgPicture.asset(
                                  AppConstSvgs.construction_svgrepo,
                                  height: 40,
                                  color: AppConstColors.blue,
                                ),
                              );
                            }
                          }(),
                          // style: const TextStyle(fontSize: 18),
                        );
                      },
                    ),
                  ),
                ],
              ),
              AppBox.h10,

              // AnimatedBuilder(
              //   animation: _controllerTextWritting,
              //   builder: (context, child) {
              //     return AppTextGlobal.mediumText(
              //         text: widget.message.substring(0, _characterCount.value) + (_characterCount.value == widget.message.length ? '' : '...'), fontWeight: FontWeight.bold);
              //   },
              // ),
              // Text(widget.message),
              // Stack(
              //   children: [
              //     AnimatedBuilder(
              //       animation: _controllerTextWritting,
              //       builder: (context, child) {
              //         return ConstTextApp.mediumText(
              //             text: widget.message
              //                 .substring(0, _characterCount.value));
              //       },
              //     ),
              //* efectos: escribiendo y salto de letra
              AnimatedBuilder(
                animation: _controllerTextWritting,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: _controllerTextWait,
                    builder: (context, child) {
                      return !_controllerTextWritting.isAnimating
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(widget.message.length, (index) {
                                return Transform.translate(
                                  offset: Offset(0, _charAnimations[index].value),
                                  child: AppTextGlobal.mediumText(
                                    text: widget.message[index],
                                  ),
                                );
                              }),
                            )
                          : AppTextGlobal.mediumText(
                              text: widget.message.substring(0, _characterCount.value) + (_characterCount.value == widget.message.length ? '' : '...'),
                            );
                    },
                  );
                },
              ),
              //     //*efecto: salto de letra
              // Visibility(
              //   child: AnimatedBuilder(
              //     animation: _controllerTextWait,
              //     builder: (context, child) {
              //       return Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children:
              //             List.generate(widget.message.length, (index) {
              //           return Transform.translate(
              //             offset: Offset(0, _charAnimations[index].value),
              //             child: ConstTextApp.mediumText(
              //               text: widget.message[index],
              //             ),
              //           );
              //         }),
              //       );
              //     },
              //   ),
              // )
              //   ],
              // ),
            ],
          ),
        );
      },
    );
  }
}

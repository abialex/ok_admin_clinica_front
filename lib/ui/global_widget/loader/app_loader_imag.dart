import 'package:admin_clinica_front/common/constants/app_const_images.dart';
import 'package:admin_clinica_front/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppLoaderImag extends StatelessWidget {
  const AppLoaderImag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppConstColors.slg01.withOpacity(0.6),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                // alignment: Alignment.center,
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CircularProgressIndicator(
                      // strokeAlign: 20,
                      strokeWidth: 10,
                      backgroundColor: AppConstColors.white,
                      color: AppConstColors.slg04,
                    ),
                  ),
                  CarruselImag()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCorrusel extends StatefulWidget {
  @override
  _MyCorruselState createState() => _MyCorruselState();
}

class _MyCorruselState extends State<MyCorrusel> {
  final List<String> imgList = [
    'https://via.placeholder.com/600x400?text=Image+1',
    'https://via.placeholder.com/600x400?text=Image+2',
    'https://via.placeholder.com/600x400?text=Image+3',
    'https://via.placeholder.com/600x400?text=Image+4',
    'https://via.placeholder.com/600x400?text=Image+5',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4), // Cambia cada 1 segundo
          height: 400.0,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
        items: imgList
            .map((item) => Container(
                  child: Center(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class CarruselImag extends StatefulWidget {
  const CarruselImag({
    super.key,
  });

  @override
  State<CarruselImag> createState() => _CarruselImagState();
}

class _CarruselImagState extends State<CarruselImag> with TickerProviderStateMixin {
  late AnimationController _controllerTextWait;
  @override
  void initState() {
    super.initState();

    _controllerTextWait = AnimationController(
      duration: const Duration(seconds: 25),
      vsync: this,
    );

    _controllerTextWait.addListener(() {
      if (_controllerTextWait.status == AnimationStatus.completed) {
        _controllerTextWait.forward(from: 0);
      }
    });
    _controllerTextWait.forward();
  }

  @override
  void dispose() {
    _controllerTextWait.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controllerTextWait,
      builder: (context, child) {
        return AnimatedSwitcher(
          duration: 3.seconds,
          child: () {
            if (_controllerTextWait.value < 0.2) {
              return Image.asset(AppConstImages.imag01);
            } else if (_controllerTextWait.value < 0.4) {
              return SizedBox(child: Image.asset(AppConstImages.imag02));
            } else if (_controllerTextWait.value < 0.6) {
              return Container(
                child: Image.asset(AppConstImages.imag03),
              );
            } else if (_controllerTextWait.value < 0.8) {
              return Image.asset(AppConstImages.imag04);
            }
            return Container(child: Image.asset(AppConstImages.imag05));
          }(),
        );
      },
    );
  }
}

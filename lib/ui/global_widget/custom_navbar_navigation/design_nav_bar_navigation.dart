import 'dart:math';

import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import 'cubit/navbar_cubit.dart';

class DesignNavCustom extends StatefulWidget {
  final Function(int)? onDestinationSelected;
  final Color iconBackgroundColorSelected;
  final Color iconBackgroundColorNoSelected;
  final Color iconColor;
  final Color backgroundColor;
  final List<RutasNav> items;
  final Function(int) onTabChanged;
  final int initialIndex;
  final double heightNavBar;
  final int currentIndex;

  const DesignNavCustom({
    super.key,
    this.onDestinationSelected,
    this.backgroundColor = AppColors.greenAccent,
    this.iconBackgroundColorSelected = AppColors.cyan,
    this.iconBackgroundColorNoSelected = AppColors.greenAccent,
    this.iconColor = AppColors.white,
    required this.items,
    required this.onTabChanged,
    this.initialIndex = 0,
    this.heightNavBar = 85,
    this.currentIndex = -1,
  });

  @override
  State<DesignNavCustom> createState() => _DesignNavCustomState();
}

class _DesignNavCustomState extends State<DesignNavCustom> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animElevationIn;
  late Animation _animElevationOut;
  late Animation<Color?> _animColorRevert;
  late Animation<Color?> _animColor;
  late Animation _animatedProgress;
  late double positionChild;
  final int maxElevation = 30;

  //para saber que childs están entre el oldindex y el index
  List<int> createListBetweenChildIndexs({required int start, required int end}) {
    List<int> resultList = [];

    if (start <= end) {
      for (int i = start + 1; i < end; i++) {
        resultList.add(i);
      }
    } else {
      for (int i = start - 1; i > end; i--) {
        resultList.add(i);
      }
    }

    return resultList;
  }

  List<List<double>> listTime = [];
  //para animar los childs que están entre el old index y el index
  createListTimeChild(int length) {
    listTime.clear();
    for (int i = 0; i < length; i++) {
      listTime.add([i * 1 / length, (i + 1) * 1 / length]);
    }
  }

  @override
  void initState() {
    super.initState();

    final navbarCubit = context.read<NavbarCubit>();
    navbarCubit.updateIndexCurrent(widget.currentIndex);

    positionChild = widget.heightNavBar / 7;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    //elevation animation
    _animElevationIn = CurveTween(
      curve: const Interval(0, 0.2, curve: Curves.decelerate),
    ).animate(_controller);
    _animElevationOut = CurveTween(
      curve: const Interval(0.2, 1, curve: Curves.bounceOut),
    ).animate(_controller);

    //color animation
    _animColorRevert = ColorTween(
      begin: widget.iconBackgroundColorSelected,
      end: widget.iconBackgroundColorNoSelected,
    ).animate(_controller);

    _animColor = ColorTween(
      begin: widget.iconBackgroundColorNoSelected,
      end: widget.iconBackgroundColorSelected,
    ).animate(_controller);

    //ptogress animation
    _animatedProgress = CurveTween(
      curve: const Interval(0, 1, curve: Curves.decelerate),
    ).animate(_controller);
    _controller.forward(from: 0.0000001);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Stack(
        fit: StackFit.expand,
        children: [
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.deepPurple),
                label: 'Inicio',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business, color: Colors.green),
                label: 'Negocios',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school, color: Colors.blue),
                label: 'Educación',
                backgroundColor: Colors.white,
              ),
            ],
            // Esta configuración es opcional dependiendo de tu diseño
            type: BottomNavigationBarType.fixed, // Fija la barra sin animación en cambios
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
          const BlurryContainer(),
        ],
      );
      // return Container(
      //   alignment: Alignment.center,
      //   color: AppColors.greyLight,
      //   child: const Text(
      //     "EL NAVBAR NO TIENE OPCIONES PARA MOSTRAR",
      //     style: TextStyle(
      //       color: AppColors.black,
      //     ),
      //   ),
      // );
    }
    final navbarCubit = context.read<NavbarCubit>();
    final int currentIndexCubit = navbarCubit.state.currentIndex;
    final int oldIndexCubit = navbarCubit.state.oldIndex;
    List<int> listBetweenChild = createListBetweenChildIndexs(start: oldIndexCubit, end: currentIndexCubit);
    createListTimeChild(listBetweenChild.length);

    double currentWidth = MediaQuery.of(context).size.width;
    double widthChild = currentWidth / widget.items.length;

    double progressPositionChildSelected = 0;
    double progressPositionChildOldSelected = 0;
    double progress = 0;
    double progressPositionBox = 0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        progress = _animatedProgress.value;

        // progressPositionChildSelected = -maxElevation * _animElevationIn.value +
        //     maxElevation * _animElevationOut.value -
        //     positionChild;

        // progressPositionChildOldSelected =
        //     positionChild * _animatedProgress.value - positionChild;

        progressPositionBox = widthChild * oldIndexCubit + (currentIndexCubit - oldIndexCubit) * widthChild * progress;
        return Stack(
          children: [
            _buildBaseNavBar(currentWidth, widget.heightNavBar),
            _buildBoxSelector(progressPositionBox, widthChild),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              width: currentWidth,
              height: widget.heightNavBar,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(widget.items.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        //si es el item seleccioando que no ejecute nada
                        if (index == currentIndexCubit) return;
                        // navbarCubit.updateIndexCurrent(index);
                        widget.onDestinationSelected!(index);
                      },
                      child: () {
                        //child seleccionado
                        if (index == currentIndexCubit) {
                          return _buildChildSelected(progressPositionChildSelected, index);
                        }
                        //child old seleccionado
                        else if (index == oldIndexCubit) {
                          return _buildChildOldSelected(progressPositionChildOldSelected, index);
                        }
                        //childs
                        return _buildChildDontSelected(listBetweenChild, progress, index);
                      }(),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }

  Transform _buildBoxSelector(double progressPositionBox, double widthChild) {
    return Transform.translate(
      offset: Offset(progressPositionBox, -10),
      // child: CustomPaint(
      //   size: Size(widthChild, widget.heightNavBar - 35),
      //   painter: ArcoPainter(backgroundColors: Colors.black87),
      // ),
      child: SizedBox(
        height: widget.heightNavBar - 35,
        width: widthChild,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextBootom(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 10),
    );
  }

  Widget _buildBaseNavBar(double width, double heigth) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(0),
        ),
      ),
      height: heigth,
    );
  }

  //Child build
  Widget _buildChildSelected(double elevation, int index) {
    return Transform.translate(
      offset: Offset(0.0, elevation),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(radius: 28, foregroundColor: _animColorRevert.value, backgroundColor: _animColor.value, child: Icon(widget.items[index].icon)),
          _buildTextBootom(widget.items[index].titulo)
        ],
      ),
    );
  }

  Widget _buildChildOldSelected(double elevation, int index) {
    return Transform.translate(
      offset: Offset(0.0, elevation),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(radius: 25, foregroundColor: _animColor.value, backgroundColor: _animColorRevert.value, child: Icon(widget.items[index].icon)),
          _buildTextBootom(widget.items[index].titulo),
        ],
      ),
    );
  }

  Widget _buildChildDontSelected(List<int> listChildBeetween, double progress, int index) {
    final Color colorBackground = listChildBeetween.contains(index)
        ? listTime[listChildBeetween.indexOf(index)][0] < progress && progress < listTime[listChildBeetween.indexOf(index)][1]
            ? Colors.white
            : widget.backgroundColor
        : widget.backgroundColor;

    final Color colorForeground = listChildBeetween.contains(index)
        ? listTime[listChildBeetween.indexOf(index)][0] < progress && progress < listTime[listChildBeetween.indexOf(index)][1]
            ? widget.iconBackgroundColorNoSelected
            : widget.iconBackgroundColorSelected
        : widget.iconBackgroundColorSelected;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          radius: 25,
          foregroundColor: colorForeground,
          backgroundColor: colorBackground,
          child: Icon(widget.items[index].icon),
        ),
        _buildTextBootom(widget.items[index].titulo),
      ],
    );
  }
}

class RutasNav {
  final IconData icon;
  final String titulo;
  final String routePage;
  final Widget? page;

  RutasNav({
    required this.icon,
    required this.titulo,
    required this.routePage,
    this.page,
  });
}

class ArcoPainter extends CustomPainter {
  final Color backgroundColors;

  ArcoPainter({required this.backgroundColors});

  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint()..color = backgroundColors;

    // final path = Path()
    //   ..moveTo(0, size.height * 0.5)
    //   ..lineTo(size.width * 0.1, 0)
    //   ..lineTo(size.width, 0)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width * 0.1, size.height)
    //   ..close();

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final rect = Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    const startAngle = -pi / 4; // Ángulo de inicio en radianes
    const sweepAngle = pi / 2; // Ángulo de barrido en radianes

    final path = Path()
      ..arcTo(rect, startAngle, sweepAngle, false) // Dibuja el arco
      ..lineTo(size.width / 2, size.height / 2) // Dibuja una línea al centro
      ..close(); // Cierra el camino

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BlurryContainer extends StatelessWidget {
  const BlurryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.75),
              width: 1.0,
            ),
          ),
          child: const Center(
            child: Text(
              'EL NAVBAR NO TIENE OPCIONES DE NAVEGACIÓN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

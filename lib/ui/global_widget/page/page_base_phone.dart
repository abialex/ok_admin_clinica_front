import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/router.dart';
import '../custom_navbar_navigation/design_nav_bar_navigation.dart';

class PageBasePhone extends StatelessWidget {
  final Widget bodySliver;
  final Widget footerSliver;
  final Widget headerWidget;

  final String title;
  final Widget floatingWidget;
  final double heightExpand;
  const PageBasePhone({
    super.key,
    required this.bodySliver,
    required this.title,
    this.floatingWidget = const SizedBox.shrink(),
    this.footerSliver = const SizedBox.shrink(),
    this.headerWidget = const SizedBox.shrink(),
    this.heightExpand = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    // Header
                    SliverPersistentHeader(
                      delegate: MySliverHeaderDelegate(
                        title: title,
                        expandedHeight: heightExpand,
                        widgetHeader: headerWidget,
                      ),
                      pinned: true,
                      // floating: false,
                    ),

                    // Body

                    bodySliver,

                    // Footer
                    SliverFillRemaining(
                      hasScrollBody: false, // el contenido ocupa todo el espacio que sliverList ocupa
                      fillOverscroll: false,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: footerSliver,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: floatingWidget,
                ),
              ],
            ),
          ),
          Container(
              height: 70,
              alignment: Alignment.center,
              child: DesignNavCustom(
                heightNavBar: 70,
                initialIndex: 2,
                backgroundColor: AppColors.blueSecondary,
                iconBackgroundColorNoSelected: AppColors.blueSecondary,
                iconBackgroundColorSelected: AppColors.white,
                onDestinationSelected: (p0) async {
                  context.read<NavigatorCubit>().updateIndexDelay(p0);
                  Navigator.pushReplacementNamed(context, context.read<NavigatorCubit>().state.modulesList[p0].routePage);
                },
                items: context.read<NavigatorCubit>().state.modulesList,
                currentIndex: context.read<NavigatorCubit>().state.delayIndex,
              )),
        ],
      ),
    );
  }
}

const _maxExtend = 50.0;
const _minExtend = 50.0;

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget widgetHeader;
  final Widget widgetHeaderBody;
  final double expandedHeight;
  final String title;

  MySliverHeaderDelegate({
    required this.expandedHeight,
    required this.title,
    this.widgetHeader = const SizedBox.shrink(),
    this.widgetHeaderBody = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final percent = (1 - shrinkOffset / _maxExtend);
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image.network(
        //   "https://via.placeholder.com/350x150",
        //   fit: BoxFit.cover,
        // ),
        GestureDetector(
          onTap: () {
            final navbarCubit = context.read<NavigatorCubit>();
            navbarCubit.updateIndexDelay(1);

            Navigator.pushReplacementNamed(context, Routes.login);
          },
          child: Container(
            // height: 400,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black54],
                stops: [0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: AppColors.yellow,
                  height: 50,
                  child: widgetHeader,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: shrinkOffset == 0
                      ? Container(
                          alignment: Alignment.center,
                          color: AppColors.lightFillColor,
                          child: widgetHeaderBody,
                        )
                      : const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 5.0,
        //   left: 16.0,
        //   child: Text(
        //     "Opciones de titulo",
        //     style: TextStyle(
        //       fontSize: (20 * percent).clamp(12, 40),
        //       color: Colors.deepOrangeAccent,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  double get maxExtent => _maxExtend;

  @override
  double get minExtent => _minExtend;

  @override
  bool shouldRebuild(MySliverHeaderDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight;
  }
}

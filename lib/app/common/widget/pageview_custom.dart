import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class PageItemCustom {
  final String titleText;
  final Widget widget;

  PageItemCustom({
    required this.titleText,
    required this.widget,
  });
}

class MyPageViewCustom extends StatefulWidget {
  final List<PageItemCustom> listWidgets;
  const MyPageViewCustom({
    super.key,
    required this.listWidgets,
  });

  @override
  _MyPageViewCustomState createState() => _MyPageViewCustomState();
}

class _MyPageViewCustomState extends State<MyPageViewCustom> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  nextPage() {
    setState(() {
      _currentPage = (_currentPage + 1).clamp(0, widget.listWidgets.length);
      _goToPage(_currentPage);
    });
  }

  previusPage() {
    setState(() {
      _currentPage = (_currentPage - 1).clamp(0, widget.listWidgets.length);
      _goToPage(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            widget.listWidgets.length,
            (index) => _buildHeaderButton(text: widget.listWidgets[index].titleText, index: index),
          ),
          // children: [
          //   _buildHeaderButton(text: "Presupuesto", index: 0),
          //   _buildHeaderButton(text: "Tratamiento", index: 1),
          //   _buildHeaderButton(text: "hola mundo", index: 2),
          // ],
        ),
        Expanded(
          child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: List.generate(widget.listWidgets.length, (index) => widget.listWidgets[index].widget)),
        ),
      ],
    );
  }

  Widget _buildHeaderButton({required String text, index = 0}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _goToPage(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(color: index == _currentPage ? AppConstColors.slg01 : AppConstColors.white, border: Border.all()),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: index == _currentPage ? AppConstColors.white : AppConstColors.slg01,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ExternalWidget extends StatelessWidget {
  final VoidCallback onNextPage;
  final VoidCallback onPrevPage;

  ExternalWidget({required this.onNextPage, required this.onPrevPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPrevPage,
          child: Text('Previous Page'),
        ),
        ElevatedButton(
          onPressed: onNextPage,
          child: Text('Next Page'),
        ),
      ],
    );
  }
}

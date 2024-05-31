import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

interface class ItemPage {
  final String titulo;
  final Widget widget;

  ItemPage({required this.titulo, required this.widget});
}

class FormPages extends StatelessWidget {
  final List<ItemPage> items;
  const FormPages({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexCubit(),
      child: BlocBuilder<IndexCubit, int>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    items.length,
                    (index) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<IndexCubit>().changeIndex(index);
                            },
                            child: AnimatedContainer(
                              duration: 0.25.seconds,
                              padding: const EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(5),
                                ),
                                border: Border.all(color: index == state ? AppColors.slgPrincipal : AppColors.slg01),
                                color: index == state ? AppColors.slgPrincipal : AppColors.slg01,
                              ),
                              child: AppTextGlobal.labelLightText(
                                text: items[index].titulo,
                                colorText: AppColors.white,
                                fontSize: 14,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )),
              ),
              items[state].widget,
            ],
          );
        },
      ),
    );
  }
}

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);

  void changeIndex(int mode) {
    emit(mode);
  }

  void resetToIndex() {
    emit(0);
  }
}

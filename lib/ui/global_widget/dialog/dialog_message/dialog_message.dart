import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_base.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_cancel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/dialog_message_cubit.dart';

class DialogCubitPage extends StatelessWidget {
  final TextAlign textAlign;
  final Color colorTitle;
  final Color colorMensaje;

  final String textAceptarCustom;
  final String textCancelarCustom;
  final bool onlyOptions;

  const DialogCubitPage(
      {super.key,
      this.textAlign = TextAlign.center,
      this.colorTitle = AppConstColors.dark,
      this.colorMensaje = AppConstColors.dark,
      this.textAceptarCustom = "Aceptar",
      this.textCancelarCustom = "Cancelar",
      this.onlyOptions = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogMessageCubit, DialogMessageState>(
      builder: (ctx, state) {
        final DialogMessageCubit dialogCubit = context.read();
        return Visibility(
          visible: state.show,
          child: Container(
            color: Colors.black38,
            child: Center(
              child: Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: IntrinsicWidth(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: AppConstColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                        height: 270,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.titulo,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: colorTitle,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: AppTextGlobal.lightText(
                                        text: state.texto,
                                        maxLines: 4,
                                        textAlign: TextAlign.center,
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            AnimatedSwitcher(
                                duration: const Duration(seconds: 3),
                                child: state.onlyOptions
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: ButtonCustomBase(
                                              textColor: AppConstColors.white,
                                              backgroundColor: state.colorBackground,
                                              onClick: () {
                                                dialogCubit.disguiseDialog();
                                                state.onAceptar?.call();
                                              },
                                              text: "Aceptar",
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        // textDirection: TextDirection.rtl,
                                        children: [
                                          Expanded(
                                            child: ButtonCancel(
                                              onClick: () {
                                                dialogCubit.disguiseDialog();
                                                state.onCancelar?.call();
                                              },
                                              text: "Cancelar",
                                            ),
                                          ),
                                          AppBox.w10,
                                          Expanded(
                                            child: ButtonCustomBase(
                                              textColor: AppConstColors.white,
                                              backgroundColor: state.colorBackground,
                                              onClick: () {
                                                dialogCubit.disguiseDialog();
                                                state.onAceptar?.call();
                                              },
                                              text: "Aceptar",
                                            ),
                                          ),
                                        ],
                                      )),
                          ]),
                        ),
                      ),
                      Positioned(
                        top: -35,
                        child: CircleAvatar(
                          backgroundColor: state.colorBackground,
                          radius: 40,
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: Icon(
                                state.icon,
                                color: AppConstColors.white,
                                size: 60,
                              )
                                  .animate(
                                    onPlay: (controller) => controller.loop(reverse: true),
                                  )
                                  .rotate(
                                    begin: -0.01,
                                    end: 0.01,
                                    duration: 0.7.seconds,
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

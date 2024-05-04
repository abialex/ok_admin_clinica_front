import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
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
      this.colorTitle = AppColors.dark,
      this.colorMensaje = AppColors.dark,
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
          child: Positioned.fill(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: AppColors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                        child: Text(
                                          state.texto,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          textAlign: textAlign,
                                          style: TextStyle(color: colorMensaje),
                                        ),
                                      ),
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
                                          Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("press"))

                                              //     ButtonCustom001WihoutAnimated(
                                              //   colorBackground:
                                              //       state.colorBackground,
                                              //   padding: const EdgeInsets
                                              //       .symmetric(
                                              //       horizontal: 20,
                                              //       vertical: 12.5),
                                              //   text: textAceptarCustom,
                                              //   onPressed: () {
                                              //     dialogCubit
                                              //         .disguiseDialog();

                                              //     if (state.onAceptar !=
                                              //         null) {
                                              //       state.onAceptar!();
                                              //     }
                                              //   },
                                              // ),
                                              ),
                                        ],
                                      )
                                    : Row(
                                        // textDirection: TextDirection.rtl,
                                        children: [
                                          Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    dialogCubit.disguiseDialog();
                                                  },
                                                  child: const Text("press"))

                                              //     ButtonCustom001WihoutAnimated(
                                              //   padding: const EdgeInsets
                                              //       .symmetric(
                                              //       horizontal: 20,
                                              //       vertical: 12.5),
                                              //   colorBackground:
                                              //       AppColors.greyLight,
                                              //   text: textCancelarCustom,
                                              //   onPressed: () {
                                              //     dialogCubit
                                              //         .disguiseDialog();

                                              //     if (state.onCancelar !=
                                              //         null) {
                                              //       state.onCancelar!();
                                              //     }
                                              //   },
                                              // ),
                                              ),
                                          Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("press"))
                                              //     ButtonCustom001WihoutAnimated(
                                              //   colorBackground:
                                              //       state.colorBackground,
                                              //   padding: const EdgeInsets
                                              //       .symmetric(
                                              //       horizontal: 20,
                                              //       vertical: 12.5),
                                              //   text: textAceptarCustom,
                                              //   onPressed: () {
                                              //     dialogCubit
                                              //         .disguiseDialog();

                                              //     if (state.onAceptar !=
                                              //         null) {
                                              //       state.onAceptar!();
                                              //     }
                                              //   },
                                              // ),
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
                          child: Icon(
                            state.icon,
                            color: AppColors.white,
                          ),
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

import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/modules/login/bloc/cubit/show_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextFormFieldBox extends StatelessWidget {
  const AppTextFormFieldBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.isObscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool? isObscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowPasswordCubit(),
      child: Builder(builder: (context) {
        final showPassword = context.watch<ShowPasswordCubit>();
        return TextFormField(
          cursorColor: AppConstColors.dark,
          controller: controller,
          obscureText: isObscureText == true ? !showPassword.state : false,
          style: const TextStyle(color: AppConstColors.dark),
          validator: validator,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            isCollapsed: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.all(10),
            hintStyle: const TextStyle(
              fontSize: 15,
              color: AppConstColors.grey,
            ),
            suffixIcon: isObscureText != null
                ? IconButton(
                    icon: Icon(
                      showPassword.state ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                      color: AppConstColors.slg01,
                    ),
                    onPressed: () {
                      showPassword.toggle();
                    },
                  )
                : const SizedBox.shrink(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppConstColors.dark,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppConstColors.darkAppBar,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppConstColors.redSunat,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppConstColors.darkAppBar,
              ),
            ),
          ),
          expands: false,
        );
      }),
    );
  }
}

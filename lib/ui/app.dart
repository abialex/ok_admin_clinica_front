import 'package:admin_clinica_front/core/theme/app_theme.dart';
import 'package:admin_clinica_front/ui/core/router.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/dialog_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().theme(),

      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      locale: const Locale('es'),
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.login,
      builder: (context, child) {
        return Stack(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(
                  MediaQuery.of(context).textScaleFactor.clamp(
                        1.0,
                        1.2,
                      ),
                ),
              ),
              child: child!,
            ),
            BlocBuilder<DialogMessageCubit, DialogMessageState>(
              builder: (context, state) {
                if (state.show) {
                  return const DialogCubitPage();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

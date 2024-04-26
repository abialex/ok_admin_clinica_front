import 'package:admin_clinica_front/data/datasources/local/auth_service.dart';
import 'package:admin_clinica_front/data/datasources/remote/cita_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/doctor_api.dart';
import 'package:admin_clinica_front/data/datasources/remote/usuario_api.dart';
import 'package:admin_clinica_front/data/models/cita/cita_agil/cita_agil_update.dart';
import 'package:admin_clinica_front/data/models/request/request_model.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/dialog_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injections.dart';
import 'data/models/cita/cita_agil/cita_agil_create.dart';
import 'ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';

void main() async {
  await setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DialogMessageCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dialog = context.read<DialogMessageCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DialogCubitPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed :',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = locator<DoctorApi>();
          final storage = locator<AuthService>();
          storage.saveToken("token 47a868ce1c2c87cd80a68771405553f2fbe4c5d9");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          dialog.showDialog(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

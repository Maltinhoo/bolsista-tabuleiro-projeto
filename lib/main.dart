import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/login/presenter/cubit/login_cubit.dart';
import 'modules/login/presenter/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => inject<LoginCubit>()..initialize(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

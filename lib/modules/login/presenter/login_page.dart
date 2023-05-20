import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/login/presenter/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presenter/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => inject<LoginCubit>()..initialize(),
        child: BlocListener<LoginCubit, LoginState>(
          bloc: inject<LoginCubit>(),
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }

            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red));
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Scaffold(
                  backgroundColor: const Color(0xff5E115B),
                  body: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/tabulero.png'),
                          const SizedBox(height: 50),
                          Container(
                              padding: const EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width * .7,
                              height: MediaQuery.of(context).size.height * .35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5))
                                ],
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Email',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) => value?.isEmpty ?? true
                                        ? 'Por favor, digite seu email'
                                        : null,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          obscureText: _obscureText,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Senha',
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          validator: (value) => value
                                                      ?.isEmpty ??
                                                  true
                                              ? 'Por favor, digite sua senha'
                                              : null,
                                          onChanged: (value) {
                                            password = value;
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: Icon(_obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      )
                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<LoginCubit>(context)
                                            .login(email, password);
                                      }
                                    },
                                    child: const Text('Entrar'),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}

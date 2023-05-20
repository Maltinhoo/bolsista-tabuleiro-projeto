import 'package:bolsista_tabuleiro_project/core/inject/inject.dart';
import 'package:bolsista_tabuleiro_project/modules/login/presenter/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../home/presenter/home_page.dart';
import '../../preferences/preferences_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Future _allFutures;
  late Future<void> getItFuture;
  late bool isLogged;

  double imageSize = 200;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    getItFuture = GetIt.I.allReady();

    _allFutures = Future.wait([
      getItFuture,
    ]);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(curve: Curves.easeIn, parent: _animationController))
      ..addListener(() {
        setState(() {
          imageSize = 200 + (_animation.value * 100);
        });
      });

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToHome();
      }
    });
    super.initState();
  }

  void _navigateToHome() async {
    await _allFutures;

    isLogged = await inject<IPreferencesHelper>().getIsLogged();
    if (isLogged) {
      _goToHome();
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _goToHome() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5E115B),
      body: Center(
        child: Image.asset(
          'assets/images/tabulero.png',
          height: _animation.value * 100 + 200,
          width: _animation.value * 100 + 200,
        ),
      ),
    );
  }
}

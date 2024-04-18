import 'package:flutter/material.dart';
import 'package:test_1/services/shared_preferences.dart';
import 'package:test_1/views/home_screen.dart';
import 'package:test_1/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    logincheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  logincheck(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = SharedPreference.instance.getToke();
    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  }
}

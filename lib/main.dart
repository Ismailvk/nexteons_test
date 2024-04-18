import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/controller/login/login_bloc.dart';
import 'package:test_1/services/shared_preferences.dart';
import 'package:test_1/views/home_screen.dart';
import 'package:test_1/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.instance.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: const MaterialApp(
        title: "Nexteons App",
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
        title: Image.asset('assets/images/app_bar.png'),
        actions: [
          const Icon(Icons.menu),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

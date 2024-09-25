import 'package:flutter/material.dart';
import 'package:vi_mi/core/injections.dart';
import 'package:vi_mi/presentation/pages/splash_screen.dart';

void main() async {
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vimi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}

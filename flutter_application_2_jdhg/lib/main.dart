import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PaseoCaninoApp());
}

class PaseoCaninoApp extends StatelessWidget {
  const PaseoCaninoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // REQUERIMIENTO: MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaseoCanino', // NOMBRE DE LA APLICACIÓN
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
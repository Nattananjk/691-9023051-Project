import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PeaPaymentApp());
}

class PeaPaymentApp extends StatelessWidget {
  const PeaPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PEA Smart Payment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B1FA2),
          primary: const Color(0xFF7B1FA2),
          secondary: const Color(0xFFFF6F00),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7B1FA2),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
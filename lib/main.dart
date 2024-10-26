import 'package:flutter/material.dart';
import 'package:zetexa_practical/qr_generator/qr_genrator_screen.dart';
import 'package:zetexa_practical/qr_scanner/qr_scanner_page.dart';

void main() {
  runApp(const MyApp());
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
      home: QrGeneratorPage(),
    );
  }
}

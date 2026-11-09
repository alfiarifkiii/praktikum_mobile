import 'package:flutter/material.dart';
import 'package:t5_menu/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t7_keranjang/cart_model.dart';
import 'package:t7_keranjang/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CartModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Provider',
      home: ProductPage(),
    );
  }
}

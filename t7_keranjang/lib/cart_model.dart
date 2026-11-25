import 'package:flutter/material.dart';

class Product {
  final String nama, deskripsi;
  Product(this.nama, this.deskripsi);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;
  int get totalitems => items.length;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  // Method baru untuk menghapus item berdasarkan index
  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

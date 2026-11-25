import 'package:flutter/material.dart';
import 'package:t7_keranjang/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Anda')),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Keranjang Kosong'));
          }
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Card(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: Text(item.nama),
                  subtitle: Text(item.deskripsi),
                  // Tombol hapus per item
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cart.removeAt(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

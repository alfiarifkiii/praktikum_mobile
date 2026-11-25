import 'package:flutter/material.dart';
import 'package:t7_keranjang/cart_model.dart';
import 'package:t7_keranjang/cart_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product('Coklat', 'Coklat tidak manis tidak pahit'),
    Product('Coklat Manis', 'Coklat dengan kadar manis'),
    Product('Coklat Pahit', 'Coklat dengan kadar pahit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Sembako'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalitems}'),
                  isLabelVisible: cart.totalitems > 0,

                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.shopping_bag)),
              title: Text(item.nama),
              subtitle: Text(item.deskripsi),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(item);
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}

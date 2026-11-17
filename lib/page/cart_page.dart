import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Pannier'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Votre panier total est de"),
                Text(
                  cart.priceInEuros,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: cart.products.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Votre panier est vide"),
                        Icon(Icons.image),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.products.length,
                    itemBuilder: (context, index) {
                      final product = cart.products[index];
                      return ListTile(
                        title: Text(product.title, maxLines: 2),
                        subtitle: Text(
                          product.getPrice(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Image.network(product.image, width: 80),
                        trailing: TextButton(
                          onPressed: () => context.read<Cart>().remove(product),
                          child: Text("Retirer".toUpperCase()),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

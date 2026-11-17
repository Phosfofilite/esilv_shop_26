import 'package:esilv_shop/model/cart.dart';
import 'package:esilv_shop/model/product.dart';
import 'package:esilv_shop/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Product product(int id, num price) => Product(
  id: id,
  title: 'Produit $id',
  image: '',
  price: price,
  category: 'test',
  description: 'Description',
  rating: 3.9,
  ratingCount: 120,
);

void main() {
  test('La note et le nombre de votes survivent à la sérialisation', () {
    final original = product(1, 109.95);
    final decoded = Product.fromMap(original.toMap());
    expect(decoded, original);
    expect(decoded.rating, 3.9);
    expect(decoded.ratingCount, 120);
  });

  test('Le total reste en euros et compte les doublons et les retraits', () {
    final cart = Cart();
    final bag = product(1, 109.95);
    expect(cart.priceInEuros, '0.00€');
    cart.add(bag);
    cart.add(product(2, 22.30));
    cart.add(product(3, 10.99));
    cart.add(bag);
    expect(cart.priceInEuros, '253.19€');
    cart.remove(bag);
    expect(cart.products.length, 3);
    expect(cart.priceInEuros, '143.24€');
  });

  testWidgets('Le panier vide affiche son total et son message', (
    tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => Cart(),
        child: const MaterialApp(home: CartPage()),
      ),
    );
    expect(find.text('0.00€'), findsOneWidget);
    expect(find.text('Votre panier est vide'), findsOneWidget);
  });
}

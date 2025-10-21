import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_piloto_tres/domain/entities/product.dart';
import 'package:teste_piloto_tres/domain/repository/cart_repository_abstract.dart';

class CartRepository extends CartRepositoryAbstract with ChangeNotifier {
  @override
  late List<Product> productsInCart;

  @override
  Future<void> initializeCart() async {
    await Future.delayed(Duration(seconds: 2));
    productsInCart = [
      Product(id: 'p1', name: 'Maçã Fuji (Kg)', price: 8.99),
      Product(id: 'p2', name: 'Leite Integral (Litro)', price: 5.49),
      Product(id: 'p3', name: 'Pão de Forma', price: 7.20),
    ];
  }

  @override
  void addProductInCart(Product product) {
    if (productsInCart.contains(product)) {
      final int index = productsInCart.indexOf(product);
      productsInCart[index].quantity++;
    } else {
      productsInCart.add(product);
    }
    notifyListeners();
  }

  @override
  void removeProductInCart(Product product) {
    if (productsInCart.contains(product)) {
      final int index = productsInCart.indexOf(product);
      if (productsInCart[index].quantity <= 1) {
        productsInCart.remove(product);
      } else {
        productsInCart[index].quantity--;
      }
    }
    notifyListeners();
  }

  @override
  double sumAllProductInCart() {
    double total = 0.0;
    for (var item in productsInCart) {
      total += (item.price * item.quantity);
    }
    return total;
  }
}

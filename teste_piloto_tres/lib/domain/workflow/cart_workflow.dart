import 'dart:async';

import 'package:teste_piloto_tres/domain/entities/product.dart';

abstract class CartWorkflow {
  late List<Product> productsInCart;
  Future<void> initializeCart();
  void addProductInCart(Product product);
  void removeProductInCart(Product product);
  double sumAllProductInCart();
}

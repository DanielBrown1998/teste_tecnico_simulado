import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_piloto_tres/domain/repository/cart_repository_abstract.dart';
import 'package:teste_piloto_tres/presenter/components/card_cart.dart';

class CartScreen extends StatefulWidget {
  final CartRepositoryAbstract cartRepository;
  const CartScreen({
    super.key,
    required this.title,
    required this.cartRepository,
  });

  final String title;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: StreamBuilder(
                    stream: Stream.value(widget.cartRepository.productsInCart),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.none) {
                        Center(child: Text("Houve um Erro"));
                      } else if (asyncSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        Center(child: CircularProgressIndicator());
                      } else if (asyncSnapshot.connectionState ==
                          ConnectionState.done) {
                        if (asyncSnapshot.hasError) {
                          Center(
                            child: Text("Houve um Erro ao carregar dados!"),
                          );
                        }
                        if (asyncSnapshot.hasData) {
                          final data = asyncSnapshot.data!;
                          debugPrint(data.toString());
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final product = data[index];
                              return CartItems(
                                product: product,
                                addItemFunction: () {
                                  widget.cartRepository.addProductInCart(
                                    product,
                                  );
                                  setState(() {});
                                },
                                removeItemFunction: () {
                                  widget.cartRepository.removeProductInCart(
                                    product,
                                  );
                                  setState(() {});
                                },
                              );
                            },
                          );
                        }
                      }
                      return Center(child: Text("Houve um Erro Desconhecido"));
                    },
                  ),
                ),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "R\$${widget.cartRepository.sumAllProductInCart().toStringAsFixed(2)}",
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("comprar")),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

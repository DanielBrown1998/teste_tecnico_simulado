import 'package:flutter/material.dart';
import 'package:teste_piloto_tres/domain/entities/product.dart';

class CartItems extends StatefulWidget {
  final Product product;
  final Function removeItemFunction;
  final Function addItemFunction;
  const CartItems({
    super.key,
    required this.product,
    required this.addItemFunction,
    required this.removeItemFunction,
  });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 15,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.up,
        children: [
          Text(widget.product.name),
          Text("R\$${widget.product.price.toStringAsFixed(2)}"),
          Text(widget.product.quantity.toString()),
          IconButton(
            onPressed: () {
              widget.addItemFunction();
              setState(() {});
            },
            icon: Icon(Icons.plus_one),
          ),
          IconButton(
            onPressed: () {
              widget.removeItemFunction();
              setState(() {});
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

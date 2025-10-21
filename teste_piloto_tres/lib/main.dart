import 'package:flutter/material.dart';
import 'package:teste_piloto_tres/data/repository/cart_repository.dart';
import 'package:teste_piloto_tres/domain/repository/cart_repository_abstract.dart';
import 'package:teste_piloto_tres/presenter/cart/cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final CartRepositoryAbstract cartRepository = CartRepository();
  await cartRepository.initializeCart();
  runApp(MyApp(cartRepository: cartRepository));
}

class MyApp extends StatelessWidget {
  final CartRepositoryAbstract cartRepository;
  const MyApp({super.key, required this.cartRepository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CartScreen(title: 'Meu Carrinho', cartRepository: cartRepository),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teste_piloto_um/data/repositories/transaction_repository_impl.dart';
import 'package:teste_piloto_um/data/source/transaction_source_impl.dart';
import 'package:teste_piloto_um/domain/source/transaction_source.dart';
import 'package:teste_piloto_um/view/transaction/logic/transaction_cubit.dart';
import 'package:teste_piloto_um/view/transaction/ui/transaction_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final TransactionSource transactionSource = TransactionSourceImpl();
  final transictionRepository = TransactionRepositoryImpl(
    transactionSource: transactionSource,
  );

  runApp(
    BlocProvider(
      create: (context) =>
          TransactionCubit(transactionRepository: transictionRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TransactionScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

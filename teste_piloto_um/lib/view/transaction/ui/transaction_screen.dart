import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_piloto_um/data/entities/transaction_impl.dart';
import 'package:teste_piloto_um/view/transaction/logic/transaction_cubit.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder(
        bloc: context.read<TransactionCubit>()..getTransactions(),
        buildWhen: (previous, current) => current is TransactionState,
        builder: (context, state) {
          if (state is TransactionLoad || state is TransactionInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TransactionSucces) {
            final transactions = state.transactions;
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final Transaction transaction = transactions[index];
                return Card(
                  child: ListTile(
                    key: Key(transaction.id.toString()),
                    leading: Icon(
                      Icons.money,
                      color: (transaction.value > 0
                          ? Colors.green
                          : Colors.red),
                    ),
                    title: Text(transaction.value.toString()),
                    subtitle: Text(transaction.date.toUtc().toString()),
                  ),
                );
              },
            );
          }
          state = state as TransactionError;
          return Center(child: Text(state.errorMessage));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

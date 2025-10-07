part of "transaction_cubit.dart";

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoad extends TransactionState {}

class TransactionError extends TransactionState {
  final String errorMessage;
  TransactionError(this.errorMessage);
}

class TransactionSucces extends TransactionState {
  List<Transaction> transactions = [];
  TransactionSucces(this.transactions);
}

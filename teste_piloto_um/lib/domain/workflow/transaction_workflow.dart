import 'package:teste_piloto_um/data/entities/transaction_impl.dart';

abstract class TransactionWorkflow {
  Future<List<Transaction>> getAll();
  Future<Transaction> get(String id);
  Future<void> set(String id);
  Future<bool> delete(String id);
  Future<bool> update(String id);
}

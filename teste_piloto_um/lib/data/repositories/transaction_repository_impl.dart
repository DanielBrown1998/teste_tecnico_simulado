import 'package:teste_piloto_um/data/entities/transaction_impl.dart';
import 'package:teste_piloto_um/domain/repositories/transaction_repository.dart';
import 'package:teste_piloto_um/domain/source/transaction_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionSource transactionSource;

  const TransactionRepositoryImpl({required this.transactionSource});

  @override
  Future<bool> delete(String id) async {
    return await transactionSource.delete(id);
  }

  @override
  Future<Transaction> get(String id) async {
    return await transactionSource.get(id);
  }

  @override
  Future<List<Transaction>> getAll() async {
    return await transactionSource.getAll();
  }

  @override
  Future<void> set(String id) async {
    return await transactionSource.set(id);
  }

  @override
  Future<bool> update(String id) async {
    return await transactionSource.update(id);
  }
}

import "package:flutter_bloc/flutter_bloc.dart";
import "package:teste_piloto_um/data/entities/transaction_impl.dart";
import "package:teste_piloto_um/domain/repositories/transaction_repository.dart";

part "transaction_state.dart";

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository transactionRepository;

  TransactionCubit({required this.transactionRepository})
    : super(TransactionInitial());

  Future<void> getTransactions() async {
    emit(TransactionLoad());
    try {
      final transactions = await transactionRepository.getAll();
      emit(TransactionSucces(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}

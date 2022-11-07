import 'package:airplane/models/transaction_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoding());
      await TransactionSevice().createTransaction(transaction);
      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFiled(e.toString()));
    }
  }

  void fatchTransactions() async {
    try {
      emit(TransactionLoding());

      List<TransactionModel> transactions =
          await TransactionSevice().fatchTransactions();

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFiled(e.toString()));
    }
  }
}

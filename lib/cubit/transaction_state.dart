part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoding extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  const TransactionSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionFiled extends TransactionState {
  final String error;

  const TransactionFiled(this.error);

  @override
  List<Object> get props => [error];
}

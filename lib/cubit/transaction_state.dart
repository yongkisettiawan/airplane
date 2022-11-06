part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoding extends TransactionState {}

class TransactionSuccess extends TransactionState {}

class TransactionFiled extends TransactionState {
  final String error;

  const TransactionFiled(this.error);

  @override
  List<Object> get props => super.props;
}

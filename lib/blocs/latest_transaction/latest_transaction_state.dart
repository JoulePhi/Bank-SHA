part of 'latest_transaction_bloc.dart';

abstract class LatestTransactionState extends Equatable {
  const LatestTransactionState();

  @override
  List<Object> get props => [];
}

class LatestTransactionInitial extends LatestTransactionState {}

class LatestTransactionLoading extends LatestTransactionState {}

class LatestTransactionFailed extends LatestTransactionState {
  final String e;
  const LatestTransactionFailed(this.e);
  @override
  List<Object> get props => [e];
}

class LatestTransactionSuccess extends LatestTransactionState {
  final List<LatestTransactionModel> data;
  const LatestTransactionSuccess(this.data);
  @override
  List<Object> get props => [data];
}

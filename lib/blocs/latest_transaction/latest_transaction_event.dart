part of 'latest_transaction_bloc.dart';

abstract class LatestTransactionEvent extends Equatable {
  const LatestTransactionEvent();

  @override
  List<Object> get props => [];
}

class LatestTransactionGet extends LatestTransactionEvent {}

import 'package:bank_sha/models/latest_transaction_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'latest_transaction_event.dart';
part 'latest_transaction_state.dart';

class LatestTransactionBloc
    extends Bloc<LatestTransactionEvent, LatestTransactionState> {
  LatestTransactionBloc() : super(LatestTransactionInitial()) {
    on<LatestTransactionEvent>((event, emit) async {
      if (event is LatestTransactionGet) {
        try {
          emit(LatestTransactionLoading());
          final data = await TransactionService().getLatestTransaction();
          emit(LatestTransactionSuccess(data));
        } catch (e) {
          emit(LatestTransactionFailed(e.toString()));
        }
      }
    });
  }
}

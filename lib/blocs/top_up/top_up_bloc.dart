import 'package:bank_sha/models/top_up_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpEvent>((event, emit) async {
      if (event is TopUpPost) {
        try {
          emit(TopUpLoading());
          String url = await TransactionService().addAmount(event.data);
          emit(TopUpSuccess(url));
        } catch (e) {
          emit(TopUpFailed(e.toString()));
        }
      }
    });
  }
}

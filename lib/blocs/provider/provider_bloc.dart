import 'package:bank_sha/models/data_post_model.dart';
import 'package:bank_sha/models/select_provider_moder.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  ProviderBloc() : super(ProviderInitial()) {
    on<ProviderEvent>((event, emit) async {
      if (event is ProviderGet) {
        try {
          emit(ProviderLoading());
          final data = await TransactionService().getProviders();
          emit(ProviderSuccess(data));
        } catch (e) {
          emit(ProviderFailed(e.toString()));
        }
      }

      if (event is ProviderPost) {
        try {
          emit(ProviderLoading());
          await TransactionService().buyDataPlan(event.data);
          emit(ProviderBuySuccess());
        } catch (e) {
          emit(ProviderFailed(e.toString()));
        }
      }
    });
  }
}

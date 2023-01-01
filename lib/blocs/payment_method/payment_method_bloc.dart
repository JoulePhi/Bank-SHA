import 'package:bank_sha/models/payment_method_moder.dart';
import 'package:bank_sha/services/payment_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMethodLoading());
          final data = await PaymentMethodService().getPaymentMethods();
          emit(PaymentMethodSuccess(data));
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}

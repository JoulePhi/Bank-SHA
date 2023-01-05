import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_again_event.dart';
part 'send_again_state.dart';

class SendAgainBloc extends Bloc<SendAgainEvent, SendAgainState> {
  SendAgainBloc() : super(SendAgainInitial()) {
    on<SendAgainEvent>((event, emit) async {
      if (event is SendAgainGet) {
        try {
          emit(SendAgainLoading());
          final data = await UserService().sendAgain();
          emit(SendAgainSuccess(data));
        } catch (e) {
          emit(SendAgainFailed(e.toString()));
        }
      }
    });
  }
}

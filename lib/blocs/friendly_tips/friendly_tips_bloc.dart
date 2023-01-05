import 'package:bank_sha/models/friendly_tips_modle.dart';
import 'package:bank_sha/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'friendly_tips_event.dart';
part 'friendly_tips_state.dart';

class FriendlyTipsBloc extends Bloc<FriendlyTipsEvent, FriendlyTipsState> {
  FriendlyTipsBloc() : super(FriendlyTipsInitial()) {
    on<FriendlyTipsEvent>((event, emit) async {
      if (event is FriendlyTipsGet) {
        try {
          emit(FriendlyTipsLoading());
          final data = await UserService().getTips();
          emit(FriendlyTipsSuccess(data));
        } catch (e) {
          emit(FriendlyTipsFailed(e.toString()));
        }
      }
    });
  }
}

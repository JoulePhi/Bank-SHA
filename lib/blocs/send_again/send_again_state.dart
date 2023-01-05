part of 'send_again_bloc.dart';

abstract class SendAgainState extends Equatable {
  const SendAgainState();

  @override
  List<Object> get props => [];
}

class SendAgainInitial extends SendAgainState {}

class SendAgainLoading extends SendAgainState {}

class SendAgainFailed extends SendAgainState {
  final String e;
  const SendAgainFailed(this.e);
  @override
  List<Object> get props => [e];
}

class SendAgainSuccess extends SendAgainState {
  final List<UserModel> data;
  const SendAgainSuccess(this.data);

  @override
  List<Object> get props => [data];
}

part of 'send_again_bloc.dart';

abstract class SendAgainEvent extends Equatable {
  const SendAgainEvent();

  @override
  List<Object> get props => [];
}

class SendAgainGet extends SendAgainEvent {}

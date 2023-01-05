part of 'friendly_tips_bloc.dart';

abstract class FriendlyTipsEvent extends Equatable {
  const FriendlyTipsEvent();

  @override
  List<Object> get props => [];
}

class FriendlyTipsGet extends FriendlyTipsEvent {}

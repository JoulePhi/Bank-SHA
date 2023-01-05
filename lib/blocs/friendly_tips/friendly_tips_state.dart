part of 'friendly_tips_bloc.dart';

abstract class FriendlyTipsState extends Equatable {
  const FriendlyTipsState();

  @override
  List<Object> get props => [];
}

class FriendlyTipsInitial extends FriendlyTipsState {}

class FriendlyTipsLoading extends FriendlyTipsState {}

class FriendlyTipsFailed extends FriendlyTipsState {
  final String e;
  const FriendlyTipsFailed(this.e);
  @override
  List<Object> get props => [e];
}

class FriendlyTipsSuccess extends FriendlyTipsState {
  final List<FriendlyTipsModel> data;
  const FriendlyTipsSuccess(this.data);

  @override
  List<Object> get props => [data];
}

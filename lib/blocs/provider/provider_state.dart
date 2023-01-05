part of 'provider_bloc.dart';

abstract class ProviderState extends Equatable {
  const ProviderState();

  @override
  List<Object> get props => [];
}

class ProviderInitial extends ProviderState {}

class ProviderLoading extends ProviderState {}

class ProviderFailed extends ProviderState {
  final String e;
  const ProviderFailed(this.e);

  @override
  List<Object> get props => [e];
}

class ProviderSuccess extends ProviderState {
  final List<ProviderModel> data;
  const ProviderSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ProviderBuySuccess extends ProviderState {}

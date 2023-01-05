part of 'provider_bloc.dart';

abstract class ProviderEvent extends Equatable {
  const ProviderEvent();

  @override
  List<Object> get props => [];
}

class ProviderGet extends ProviderEvent {}

class ProviderPost extends ProviderEvent {
  final DataPostModel data;
  const ProviderPost(this.data);

  @override
  List<Object> get props => [data];
}

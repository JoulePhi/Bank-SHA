part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);
  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpModel data;
  const AuthRegister(this.data);
  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final EditProfileModel data;

  const AuthUpdateUser(this.data);
  @override
  List<Object> get props => [data];
}

class AuthUpdatePin extends AuthEvent {
  final UpdatePinModel data;
  const AuthUpdatePin(this.data);
  @override
  List<Object> get props => [data];
}

class AuthLogout extends AuthEvent {}

class AuthUpdateBalance extends AuthEvent {
  final int newAmount;
  const AuthUpdateBalance(this.newAmount);
  @override
  List<Object> get props => [newAmount];
}

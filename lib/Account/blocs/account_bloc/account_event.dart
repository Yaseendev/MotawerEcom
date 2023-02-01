part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class SingUpEvent extends AccountEvent {
  final String email;
  final String name;
  final String password;
  SingUpEvent({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  List<Object> get props => [email, name, password];
}

class SingInEvent extends AccountEvent {
  final String email;
  final String password;

  SingInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

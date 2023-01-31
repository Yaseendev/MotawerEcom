part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
  
  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {
  
  @override
  List<Object?> get props => [];
}

class AccountLoggedIn extends AccountState {
  
  @override
  List<Object?> get props => [];
}

class AccountError extends AccountState {
 final String? msg;

  AccountError([this.msg]);

  @override
  List<Object?> get props => [msg];
}

class AccountNoInternet extends AccountState {

  @override
  List<Object?> get props => [];
}
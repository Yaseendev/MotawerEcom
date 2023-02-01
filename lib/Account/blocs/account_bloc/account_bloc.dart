import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Account/data/repositories/account_repo.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    on<SingUpEvent>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(AccountLoading());
        await accoountRepository
            .signupUser(event.name, event.email, event.password)
            .then((value) => value.fold(
                (left) => emit(AccountError(left.message)),
                (right) => emit(AccountLoggedIn())))
            .onError((error, stackTrace) {
          print(error);
          emit(AccountError(error.toString()));
        });
      } else {
        emit(AccountNoInternet());
      }
    });

    on<SingInEvent>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(AccountLoading());
        await accoountRepository
            .signinUser( event.email, event.password)
            .then((value) => value.fold(
                (left) => emit(AccountError(left.message)),
                (right) => emit(AccountLoggedIn())))
            .onError((error, stackTrace) {
          print(error);
          emit(AccountError(error.toString()));
        });
      } else {
        emit(AccountNoInternet());
      }
    });
  }
}

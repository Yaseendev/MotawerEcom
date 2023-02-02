import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Account/data/repositories/account_repo.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'initroute_event.dart';
part 'initroute_state.dart';

class InitrouteBloc extends Bloc<InitrouteEvent, InitrouteState> {
  InitrouteBloc() : super(InitrouteInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AccoountRepository accoountRepository =
        locator.get<AccoountRepository>();
    on<InitrouteEvent>((event, emit) async {
      final connStatus = await connectivity.checkConnectivity();
      if (event is UserCheckEvent) {
        if (connStatus != ConnectivityResult.none) {
          await accoountRepository.tokenCheck().then((value) {
            if (value == null) {
              emit(InitrouteNoToken());
            } else {
              if (value) {
                emit(InitrouteValidToken());
              } else {
                emit(InitrouteInValidToken());
              }
            }
          }).onError((error, stackTrace) {
            emit(InitrouteError());
          });
        } else
          emit(InitrouteNoInternet());
      }
    });
  }
}

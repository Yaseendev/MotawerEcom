import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/models/user.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import 'package:ecommerce/Utils/services/database_service.dart';

import '../providers/account_network_provider.dart';

class AccoountRepository {
  late final AccountNetworkProvider _apiService;
  late final DatabaseService _databaseService;

  AccoountRepository({
    required AccountNetworkProvider apiService,
    required DatabaseService? databaseService,
  }) {
    this._apiService = apiService;
    this._databaseService = databaseService!;
  }

  Future<bool?> tokenCheck() async {
    final String? token = await _databaseService.getToken();
    if (token == null) return null;
    return true; //FIXME await _ApiService.tokenVerify(token);
  }

  Future<Either<Failure, User>> signupUser(
      String name, String email, String password) async {
    try {
      final result = await _apiService.signup(name, email, password);
      return Right(User.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
    
  }

  Future<Either<Failure, User>> signinUser(
      String email, String password) async {
    try {
      final result = await _apiService.signin( email, password);
      return Right(User.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
    
  }

}

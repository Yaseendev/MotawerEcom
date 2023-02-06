import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/models/user.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import '../providers/account_database_provider.dart';
import '../providers/account_network_provider.dart';

class AccoountRepository {
  late final AccountNetworkProvider _apiService;
  late final AccountDatabase _databaseService;

  AccoountRepository({
    required AccountNetworkProvider apiService,
    required AccountDatabase? databaseService,
  }) {
    this._apiService = apiService;
    this._databaseService = databaseService!;
  }

  Future<bool?> tokenCheck() async {
    final String? token = await _databaseService.getToken();
    if (token == null) return null;
    return await  _apiService.tokenCheck(token);
  }

  Future<Either<Failure, User>> signupUser(
      String name, String email, String password) async {
    try {
      final result = await _apiService.signup(name, email, password);
      await _databaseService.setToken(result['token']);
      await _databaseService.setUser(result['token']);
      return Right(User.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }

  Future<Either<Failure, User>> signinUser(
      String email, String password) async {
    try {
      final result = await _apiService.signin(email, password);
      await _databaseService.setToken(result['token']);
      return Right(User.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }

  Future<Either<Failure, User>> getUserData() async {
    try {
      final user = await _databaseService.getUser();
      if(user != null) return Right(user);
      final String? token = await _databaseService.getToken();
      final result = await _apiService.fetchUserData(token ?? '');
      return Right(User.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }
}

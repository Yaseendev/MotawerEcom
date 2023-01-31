import 'package:ecommerce/Utils/services/api_service.dart';
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

  Future signupUser(String name, String email, String password) async {
    await _apiService.signup(name, email, password);
  }

  // String getErrorMessage() =>
}

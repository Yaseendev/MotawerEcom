import 'package:ecommerce/Utils/services/database_service.dart';

class AccoountRepository {
  //late final ApiService _ApiService;
  late final DatabaseService _databaseService;

  AccoountRepository({
    //required ApiService? ApiService,
    required DatabaseService? databaseService,
  }) {
    //this._ApiService = ApiService!;
    this._databaseService = databaseService!;
  }

  Future<bool?> tokenCheck() async {
    final String? token = await _databaseService.getToken();
    if (token == null) return null;
    return true; //FIXME await _ApiService.tokenVerify(token); 
  }
}

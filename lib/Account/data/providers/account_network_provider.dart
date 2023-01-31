import 'package:dio/dio.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/Utils/services/api_service.dart';

class AccountNetworkProvider extends ApiService {
  Future<Map<String, dynamic>> signup(
      String name, String email, String password) async {
    final Response response = await dio.post(
      Urls.SIGNUP_API,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    return response.data;
  }

  @override
  String getErrorMsg(Response response) {
    switch (response.statusCode) {
      case 200:
        return '';
      case 400:
        return response.data;
      default:
        return '';
    }
  }
}

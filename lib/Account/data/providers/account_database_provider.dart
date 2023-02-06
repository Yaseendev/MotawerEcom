import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/Utils/services/database_service.dart';
import '../models/user.dart';

class AccountDatabase extends DatabaseService {
  AccountDatabase(super.secureStorage) : super();

Future<void> setToken(String token) async => await secureStorage.write(
        key: 'x-auth-token',
        value: token,
      );

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'x-auth-token');
  }

  Future<void> deleteToken() async {
    return await secureStorage.delete(key: 'x-auth-token');
  }

  Future<User?> getUser() async {
    final userBox = await Boxes.getUserBox();
    return userBox.get('currentUser');
  }

    Future<void> setUser(User user) async {
    final userBox = await Boxes.getUserBox();
    await userBox.put('currentUser', user);
  }

}
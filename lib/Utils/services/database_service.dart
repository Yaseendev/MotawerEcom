import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  DatabaseService(this.secureStorage) {
    // Hive
    //   ..registerAdapter(UserAdapter())
    //   ..registerAdapter(NameAdapter());
  }
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
}

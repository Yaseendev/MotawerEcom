import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  DatabaseService(this.secureStorage) {
    // Hive
    //   ..registerAdapter(UserAdapter())
    //   ..registerAdapter(NameAdapter());
  }
    Future<void> setToken(String token) async => await secureStorage.write(
        key: 'token',
        value: token,
      );

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> deleteToken() async {
    return await secureStorage.delete(key: 'token');
  }
}

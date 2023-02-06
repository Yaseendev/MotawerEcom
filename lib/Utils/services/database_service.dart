import 'package:ecommerce/Account/data/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  final FlutterSecureStorage secureStorage;
  DatabaseService(this.secureStorage) {

    if(!Hive.isAdapterRegistered(0))
      Hive.registerAdapter(UserAdapter());
    //   ..registerAdapter(NameAdapter());
  }
}

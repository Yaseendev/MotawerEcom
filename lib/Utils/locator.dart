import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Account/data/providers/account_database_provider.dart';
import 'package:ecommerce/Account/data/providers/account_network_provider.dart';
import 'package:ecommerce/Admin/data/providers/admin_network_provider.dart';
import 'package:ecommerce/Admin/data/repositories/admin_repository.dart';
import 'package:ecommerce/Search/data/repositories/search_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../Account/data/repositories/account_repo.dart';
import '../Home/data/providers/category_network_provider.dart';
import '../Home/data/repositories/category_repository.dart';
import '../Search/data/providers/search_network_provider.dart';
import 'services/database_service.dart';

final locator = GetIt.instance;

Future locatorsSetup() async {
  //final prefs = await SharedPreferences.getInstance();
  final secureStorage = FlutterSecureStorage();
 final database = DatabaseService(secureStorage);
  // final ApiService apiService = ApiService(Dio(BaseOptions(
  //     connectTimeout: 25000,
  //     receiveTimeout: 25000,
  //     contentType: 'application/json',
  //     baseUrl: Urls.BASE_API,
  //     headers: {
  //       "Access-Control-Allow-Origin": "*",
  //       "Access-Control-Allow-Credentials": true,
  //       "Access-Control-Allow-Headers":
  //           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  //       "Access-Control-Allow-Methods": "POST, OPTIONS"
  //     })));
  // locator.registerLazySingleton<SharedPreferences>(() => prefs);
  locator.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  locator.registerLazySingleton<DatabaseService>(() => database);
  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton<FilePicker>(() => FilePicker.platform);
  locator.registerLazySingleton<CloudinaryPublic>(() => CloudinaryPublic('drm2gxx3r','mihbdymj'));
  
  locator.registerLazySingleton<AccountNetworkProvider>(() => AccountNetworkProvider());
  locator.registerLazySingleton<AdminNetworkProvider>(() => AdminNetworkProvider());
  locator.registerLazySingleton<AccountDatabase>(() => AccountDatabase(database.secureStorage));
  locator.registerLazySingleton<AccoountRepository>(() => AccoountRepository(
    apiService: locator.get<AccountNetworkProvider>(),
    databaseService: locator.get<AccountDatabase>(),));
  locator.registerLazySingleton<AdminRepository>(() => AdminRepository(
    accountDatabaseService: locator.get<AccountDatabase>(),
    ));
  locator.registerLazySingleton<CategoryNetworkProvider>(() => CategoryNetworkProvider());
  locator.registerLazySingleton<CategoryRepository>(() => CategoryRepository());
  locator.registerLazySingleton<SearchNetworkProvider>(() => SearchNetworkProvider());
  locator.registerLazySingleton<SearchRepository>(() => SearchRepository());

}

import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/providers/account_database_provider.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import '../providers/admin_network_provider.dart';

class AdminRepository {
  late final AdminNetworkProvider _apiService;
  late final AccountDatabase _databaseService;

  AdminRepository({
    required AccountDatabase? accountDatabaseService,
  }) {
    this._apiService = locator.get<AdminNetworkProvider>();
    this._databaseService = accountDatabaseService!;
  }

  Future<Either<Failure, Product>> postProduct(Product product) async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      final result = await _apiService.postProduct(product, token);
      return Right(Product.fromMap(result));
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }

  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      final result = await _apiService.getAllProducts(token);
      return Right(result.map((e) => Product.fromMap(e)).toList());
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }

  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      await _apiService.deleteProduct(productId, token);
      return Right(null);
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }
}

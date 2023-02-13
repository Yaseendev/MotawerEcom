import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/providers/account_database_provider.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import '../providers/category_network_provider.dart';

class CategoryRepository {
  late final CategoryNetworkProvider _apiService;
  late final AccountDatabase _databaseService;

    CategoryRepository() {
    this._apiService = locator.get<CategoryNetworkProvider>();
    this._databaseService = locator.get<AccountDatabase>();
  }

    Future<Either<Failure, List<Product>>> fetchCategoryProducts(String category) async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      final result = await _apiService.getAllProducts(token, category);
      return Right(result.map((e) => Product.fromMap(e)).toList());
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }

}
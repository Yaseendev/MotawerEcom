import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/providers/account_database_provider.dart';
import 'package:ecommerce/Admin/data/providers/admin_network_provider.dart';
import 'package:ecommerce/Product/data/models/rating.dart';
import 'package:ecommerce/Product/data/providers/product_network_provider.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import 'package:ecommerce/Utils/locator.dart';

import '../models/product.dart';

class ProductRepository {
  late final ProductNetworkProvider _productNetworkProvider;
  late final AccountDatabase _databaseService;

  ProductRepository() {
    this._productNetworkProvider = locator.get<ProductNetworkProvider>();
    this._databaseService = locator.get<AccountDatabase>();
  }

  Future<Either<Failure, Product>> rateProduct(
      Product product, double rate) async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      final result = await _productNetworkProvider.rateProduct(
          token, product.id ?? '', rate);
      return Right(Product.fromMap(result));
    } catch (e) {
      return Left(Failure(_productNetworkProvider.getErrorMsg(e)));
    }
  }

  Future<double> getUserRate(Product product) async {
    try {
      final user = await _databaseService.getUser();
      return product.ratings!
          .firstWhere(
            (element) => element.userId == user!.id,
            orElse: () => Rating(userId: user!.id, rating: 0),
          ).rating;
    } catch (e) {
      return 0;
    }
  }
}

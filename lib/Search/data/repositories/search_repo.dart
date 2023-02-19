import 'package:dartz/dartz.dart';
import 'package:ecommerce/Account/data/providers/account_database_provider.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Shared/models/network_failure.dart';
import 'package:ecommerce/Utils/locator.dart';
import '../providers/search_network_provider.dart';

class SearchRepository {
  late final SearchNetworkProvider _apiService;
  late final AccountDatabase _databaseService;
  
  SearchRepository() {
    this._apiService = locator.get<SearchNetworkProvider>();
    this._databaseService = locator.get<AccountDatabase>();
  }

  Future<Either<Failure, List<Product>>> searchProducts(String term) async {
    try {
      final String? token = await _databaseService.getToken();
      if (token == null) return Left(Failure('No Token'));
      final result = await _apiService.getSearchResult(token, term);
      return Right(result.map((e) => Product.fromMap(e)).toList());
    } catch (e) {
      return Left(Failure(_apiService.getErrorMsg(e)));
    }
  }
}

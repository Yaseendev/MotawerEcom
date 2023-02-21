import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Product/data/repositories/product_repository.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(Product product) : super(ProductInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final ProductRepository _productRepo = locator.get<ProductRepository>();

    on<GetProductData>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(ProductReady(userRating: await _productRepo.getUserRate(product)));
      } else
        emit(ProductReady(userRating: 0));
    });

    on<RateProduct>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        await _productRepo.rateProduct(product, event.rate);
      }
    });
  }
}

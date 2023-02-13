import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Admin/data/repositories/admin_repository.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AdminRepository adminRepository = locator.get<AdminRepository>();
    on<SellProduct>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(ProductLoading());
        await adminRepository.postProduct(event.product).then(
          (value) => value.fold(
           (l) => emit(ProductError(l.message)),
           (r) => emit(ProductPosted(r))),
          ).onError((error, stackTrace) {
          print(error);
          emit(ProductError(error.toString()));
        });
      } else {
        emit(ProductNoInternet());
      }
    });
  }
}

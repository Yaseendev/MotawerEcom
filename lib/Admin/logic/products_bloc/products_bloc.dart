import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Admin/data/repositories/admin_repository.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AdminRepository adminRepository = locator.get<AdminRepository>();
    bool forceUpdate = false;
    on<FetchProducts>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        await adminRepository
            .fetchProducts()
            .then(
              (value) => value.fold(
                  (error) => emit(ProductsError(err: error.message)),
                  (result) => emit(ProductsFetched(products: result))),
            )
            .onError((error, stackTrace) {
          print(error);
          emit(ProductsError(err: error.toString()));
        });
      } else {
        emit(ProductsNoInternet());
      }
    });

    on<DeleteAProduct>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        final tempList = (state as ProductsFetched).products;
        emit(ProductsDeleting(productToDelete: event.productId));
        await adminRepository
            .deleteProduct(event.productId)
            .then(
              (value) => value.fold(
                (error) => emit(ProductsError(err: error.message)),
                (_) {
                  tempList
                      .removeWhere((element) => element.id == event.productId);
                  forceUpdate = !forceUpdate;
                  emit(ProductsFetched(
                    products: tempList,
                    forceFlag: forceUpdate,
                  ));
                },
              ),
            )
            .onError((error, stackTrace) {
          print(error);
          emit(ProductsError(err: error.toString()));
        });
      } else {
        emit(ProductsNoInternet());
      }
    });

    on<UpdateProducts>((event, emit) async {
      if (state is ProductsFetched) {
        final temp = List<Product>.from((state as ProductsFetched).products);
        temp.insert(0, event.product);
        emit(ProductsFetched(products: temp));
      }
    });
  }
}

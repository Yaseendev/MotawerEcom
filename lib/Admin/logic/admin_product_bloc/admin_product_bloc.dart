import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Admin/data/repositories/admin_repository.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'admin_product_event.dart';
part 'admin_product_state.dart';

class AdminProductBloc extends Bloc<AdminProductEvent, AdminProductState> {
  AdminProductBloc() : super(AdminProductInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final AdminRepository adminRepository = locator.get<AdminRepository>();
    on<SellProduct>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        emit(AdminProductLoading());
        await adminRepository
            .postProduct(event.product)
            .then(
              (value) => value.fold((l) => emit(AdminProductError(l.message)),
                  (r) => emit(AdminProductPosted(r))),
            )
            .onError((error, stackTrace) {
          print(error);
          emit(AdminProductError(error.toString()));
        });
      } else {
        emit(AdminProductNoInternet());
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Home/data/repositories/category_repository.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final CategoryRepository categoryRepository =
        locator.get<CategoryRepository>();
    on<FetchCategory>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
        await categoryRepository
            .fetchCategoryProducts(event.categoryName)
            .then(
              (result) => result.fold(
                (error) => emit(CategoryError(err: error.message)),
                (result) => emit(CategoryFetched(products: result)))
                ).onError((error, stackTrace) {
          print(error);
          emit(CategoryError(err: error.toString()));
        });
      } else {
        emit(CategoryNoInternet());
      }
    });
  }
}

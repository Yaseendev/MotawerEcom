import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:equatable/equatable.dart';

import '../data/repositories/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    final SearchRepository searchRepository = locator.get<SearchRepository>();
    
    on<FetchSearchData>((event, emit) async {
      if (await connectivity.checkConnectivity() != ConnectivityResult.none) {
          emit(SearchLoading());
          await searchRepository
              .searchProducts(event.searchTxt)
              .then((value) => value.fold((l) => emit(SearchError(l.message)), (values) => emit(SearchLoaded(values))));
        } else {
          emit(SearchNoInternet());
        }
    });
  }
}

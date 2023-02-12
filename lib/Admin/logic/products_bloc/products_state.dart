// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsNoInternet extends ProductsState {}

class ProductsError extends ProductsState {
  final String? err;

  ProductsError({
    this.err,
  });

  @override
  List<Object?> get props => [err];
}

class ProductsFetched extends ProductsState {
  final List<Product> products;
  final bool forceFlag;
  ProductsFetched({
    required this.products,
    this.forceFlag: false,
  });

  @override
  List<Object?> get props => [products , forceFlag];
}

class ProductsDeleting extends ProductsState {
  final String productToDelete;

  ProductsDeleting({
    required this.productToDelete,
  });

  @override
  List<Object?> get props => [productToDelete];
}



part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class DeleteAProduct extends ProductsEvent {
  final String productId;

  DeleteAProduct(this.productId);

  @override
  List<Object> get props => [productId];
}

class UpdateProducts extends ProductsEvent {
  final Product product;

  UpdateProducts(this.product);

  @override
  List<Object> get props => [product];
}

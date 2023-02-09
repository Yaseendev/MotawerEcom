part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String? message;

  ProductError([
    this.message,
  ]);

  @override
  List<Object?> get props => [message];
}

class ProductPosted extends ProductState {
  final Product product;

  ProductPosted(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductNoInternet extends ProductState {}
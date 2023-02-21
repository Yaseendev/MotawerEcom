part of 'admin_product_bloc.dart';

abstract class AdminProductState extends Equatable {
  const AdminProductState();

  @override
  List<Object?> get props => [];
}

class AdminProductInitial extends AdminProductState {}

class AdminProductLoading extends AdminProductState {}

class AdminProductError extends AdminProductState {
  final String? message;

  AdminProductError([
    this.message,
  ]);

  @override
  List<Object?> get props => [message];
}

class AdminProductPosted extends AdminProductState {
  final Product product;

  AdminProductPosted(this.product);

  @override
  List<Object?> get props => [product];
}

class AdminProductNoInternet extends AdminProductState {}

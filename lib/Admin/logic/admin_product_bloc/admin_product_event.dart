// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_product_bloc.dart';

abstract class AdminProductEvent extends Equatable {
  const AdminProductEvent();

  @override
  List<Object> get props => [];
}

class SellProduct extends AdminProductEvent {
  final Product product;
  SellProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

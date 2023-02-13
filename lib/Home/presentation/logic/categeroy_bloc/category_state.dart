part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryNoInternet extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryError extends CategoryState {
  final String? err;

  CategoryError({this.err});

  @override
  List<Object?> get props => [err];
}

class CategoryFetched extends CategoryState {
  final List<Product> products;

  CategoryFetched({
    required this.products,
  });

  @override
  List<Object?> get props => [products];
}

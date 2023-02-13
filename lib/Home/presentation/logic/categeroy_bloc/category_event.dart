part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchCategory extends CategoryEvent {
  final String categoryName;

  FetchCategory({
    required this.categoryName,
  });

  @override
  List<Object> get props => [categoryName];
}

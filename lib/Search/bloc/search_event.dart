part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class FetchSearchData extends SearchEvent {
  final String searchTxt;

  FetchSearchData({
       required this.searchTxt, 
         });

  @override
  List<Object?> get props => [
    searchTxt
       ];
}
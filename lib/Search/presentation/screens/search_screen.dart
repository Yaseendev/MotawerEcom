import 'package:ecommerce/Product/presentation/widgets/products_tabview_loading.dart';
import 'package:ecommerce/Search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_box.dart';
import '../widgets/search_result_view.dart';

class SearchScreen extends StatelessWidget {
  final String? searchTerm;
  const SearchScreen({
    super.key,
    this.searchTerm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: SearchBox(
          initialVal: searchTerm,
          onPress: (value) {
            context.read<SearchBloc>().add(FetchSearchData(searchTxt: value));
          },
        ),
        // Text(
        //   'Search $searchTerm',
        //   style: TextStyle(
        //     color: AppColors.PRIMARY_COLOR,
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Center(child: Icon(Icons.tune)),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) return ProductsTabViewLoading();
          if (state is SearchLoaded)
            return SearchResultView(result: state.products);
          return Container(); //TODO: Display search history
        },
      ),
    );
  }
}

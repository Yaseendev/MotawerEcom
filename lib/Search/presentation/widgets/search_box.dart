import 'package:badges/badges.dart' as badge;
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../screens/search_screen.dart';

class SearchBox extends StatefulWidget {
  final Function(String value) onPress;
  const SearchBox({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TypeAheadField(
        hideOnLoading: true,
        minCharsForSuggestions: 1,
        textFieldConfiguration: TextFieldConfiguration(
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0,
                color: Color(0xFFF6F6F6),
                style: BorderStyle.none,
              ),
            ),
            fillColor: Color(0xFFF6F6F6),
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: (value) {
            if(value.trim().isNotEmpty)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchScreen(
                  searchTerm: value,
                )));
          },
          textInputAction: TextInputAction.search,
          textAlignVertical: TextAlignVertical.bottom,
          onChanged: (value) => searchText = value,
        ),
        suggestionsCallback: (pattern) async {
          print(pattern);
          return Future.value([pattern]);
          //if (pattern.isEmpty) return [];
          // return await locator
          //     .get<SearchRepository>()
          //     .fetchSearchResult(pattern)
          //     .then((values) => products = values);
        },
        autoFlipDirection: true,
        keepSuggestionsOnLoading: false,
        itemBuilder: (context, suggestion) {
          return Container();
          // return ListTile(
          //   horizontalTitleGap: 0,
          //   leading: Icon(Icons.fastfood_rounded),
          //   title: Text(suggestion.name),
          //   subtitle: Text('${suggestion.categories[0].name}'),
          //   trailing: Text('${suggestion.price} EGP'),
          // );
        },
        onSuggestionSelected: (suggestion) {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(
          //         builder: (_) => BlocProvider<ProductBloc>(
          //               create: (context) => ProductBloc(suggestion)..add(LoadProduct()),
          //               child: ProductScreen(suggestion),
          //             )))
          //     .then((value) {
          //   if (value != null) context.read<CartCubit>().addItem(value);
          // });
        },
      ),
    );
  }
}

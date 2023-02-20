import 'package:badges/badges.dart' as badge;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Product/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/Search/data/repositories/search_repo.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/Utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../screens/search_screen.dart';

class SearchBox extends StatefulWidget {
  final String? initialVal;
  final Function(String value) onPress;
  const SearchBox({
    Key? key,
    required this.onPress,
    this.initialVal,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String searchText = '';
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController(
      text: widget.initialVal,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TypeAheadField(
        hideOnLoading: true,
        minCharsForSuggestions: 1,
        textFieldConfiguration: TextFieldConfiguration(
          controller: _searchController,
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
            if (value.trim().isNotEmpty) widget.onPress(value);
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (_) => SearchScreen(
            //           searchTerm: value,
            //         )));
          },
          textInputAction: TextInputAction.search,
          textAlignVertical: TextAlignVertical.bottom,
          onChanged: (value) => searchText = value,
        ),
        suggestionsCallback: (pattern) async {
          //print(pattern);
          //return Future.value([pattern]);
          //if (pattern.isEmpty) return [];
          List<Product>? resProducts;

          await locator
              .get<SearchRepository>()
              .searchProducts(pattern)
              .then((value) => value.fold((l) => null, (r) => resProducts = r));
          return resProducts!;
        },
        autoFlipDirection: true,
        keepSuggestionsOnLoading: false,
        hideOnEmpty: true,
        itemBuilder: (context, Product suggestion) {
          // return Container();
          return ListTile(
            horizontalTitleGap: 5,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: suggestion.images.first,
                width: 70,
                height: 80,
                placeholder: (context, url) => Image.asset(
                  'assets/images/placeholder.jpg',
                  width: 70,
                  height: 80,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/placeholder.jpg',
                  width: 70,
                  height: 80,
                ),
              ),
            ),
            title: Text(suggestion.name),
            subtitle: Text('${suggestion.category}'),
            trailing: Text('${suggestion.price} EGP'),
          );
        },
        onSuggestionSelected: (Product suggestion) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(
                    product: suggestion,
                  )));
        },
      ),
    );
  }
}

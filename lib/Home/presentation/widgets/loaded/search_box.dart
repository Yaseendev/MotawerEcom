import 'package:badges/badges.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

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
      child: TextField(
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
          if (value.isNotEmpty) {
            widget.onPress(value);
          }
        },
        textInputAction: TextInputAction.search,
        textAlignVertical: TextAlignVertical.bottom,
        onChanged: (value) => searchText = value,
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'categories_section.dart';
import 'photos_section.dart';
import 'search_box.dart';

class HomeLoadedWidget extends StatelessWidget {
  const HomeLoadedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: SearchBox(
            onPress: (value) {
              print(value);
            },
          ),
        ),
        SizedBox(height: 8),
        CategoriesSection(),
        SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 26.h,
          child: PhotosSection(),
        )
      ],
    );
  }
}

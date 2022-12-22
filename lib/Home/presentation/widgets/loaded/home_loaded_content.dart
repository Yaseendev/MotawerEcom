import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'categories_section.dart';
import 'new_arrivals_scection.dart';
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
        ),

        //New Arrival Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RestaurantScreen()));
                  },
                  label: const Text('See All'),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                ),
              ),
            ],
          ),
        ),
        //TODO: new arrivals cards
        NewArrivalSection(),
      ],
    );
  }
}

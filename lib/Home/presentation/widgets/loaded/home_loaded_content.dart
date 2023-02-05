import 'package:badges/badges.dart';
import 'package:ecommerce/Shared/presentation/sliver_delegate.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'address_box.dart';
import 'categories_section.dart';
import 'deal_of_day_section.dart';
import 'new_arrivals_scection.dart';
import 'photos_section.dart';
import 'search_box.dart';

class HomeLoadedWidget extends StatelessWidget {
  const HomeLoadedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      slivers: [
        SliverAppBar(
          //floating: true,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          pinned: true,
          toolbarHeight: 50,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: SearchBox(
            onPress: (value) {},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 14,
                top: 4,
                bottom: 14,
              ),
              child: Badge(
                badgeStyle: BadgeStyle(
                  // padding: EdgeInsets.all(5),
                  badgeColor: Theme.of(context).primaryColor,
                ),
                badgeContent: Text(
                  '2',
                  //state.fold(0, (previousValue, element) => (previousValue as int) + element.quantity).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                showBadge: true, //state.isNotEmpty,
                position: BadgePosition.topEnd(
                  end: -6,
                  // top: 5,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_rounded),
                  color: Theme.of(context).primaryColor,
                  iconSize: 30,
                ),
              ),
            ),
          ],
          bottom: AddressBox(),
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              CategoriesSection(),
              SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 26.h,
                child: PhotosSection(),
              ),
              SizedBox(height: 8),

              ///Deal of the day Section
              DealOfTheDaySection(),

              ///New Arrival Section
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

              /// new arrivals cards
              NewArrivalSection(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}

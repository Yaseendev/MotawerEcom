import 'package:badges/badges.dart' as badge;
import 'package:ecommerce/Cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Shared/presentation/sliver_delegate.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'address_box.dart';
import 'categories_section.dart';
import 'deal_of_day_section.dart';
import 'new_arrivals_scection.dart';
import 'photos_section.dart';
import '../../../../Search/presentation/widgets/search_box.dart';

class HomeLoadedWidget extends StatelessWidget {
  final Function(String term) onSearch;
  const HomeLoadedWidget({
    Key? key,
    required this.onSearch,
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
            onPress: (value) {
              onSearch(value);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 14,
                top: 4,
                bottom: 14,
              ),
              child: badge.Badge(
                badgeStyle: badge.BadgeStyle(
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
                position: badge.BadgePosition.topEnd(
                  end: -6,
                  // top: 5,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CartScreen(
                              tempProducts: [
                                Product(
                                  name: 'Product 1',
                                  desc: '',
                                  price: 300,
                                  quantity: 2,
                                  category: 'M',
                                  images: [
                                    'https://www.dubaiphone.net/web/image/product.product/2749/image_1024/Apple%20iPhone%2013%20Pro%20max%20With%20FaceTime%20-%20%28256GB%29%2C%206GB%20RAM%20%28Alpine%20Green%29?unique=95745b1'
                                  ],
                                ),
                                Product(
                                  name: 'Product 2',
                                  desc: '',
                                  price: 400,
                                  quantity: 1,
                                  category: 'M',
                                  images: [
                                    'https://www.dubaiphone.net/web/image/product.product/2749/image_1024/Apple%20iPhone%2013%20Pro%20max%20With%20FaceTime%20-%20%28256GB%29%2C%206GB%20RAM%20%28Alpine%20Green%29?unique=95745b1'
                                  ],
                                ),
                              ],
                            )));
                  },
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

import 'package:banner_carousel/banner_carousel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/cart_buttons_section.dart';
import '../widgets/description_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final ScrollController _scrollController;

  bool get _isSliverAppBarCollapsed {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.height * .34) - kToolbarHeight;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              pinned: true,

              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: _isSliverAppBarCollapsed
                  ? Text(
                      widget.product.name,
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    )
                  : null,

              leading: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all(
                      CircleBorder(),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF5F5F5)),
                    alignment: Alignment.centerLeft,
                    // /padding: MaterialStateProperty.all(EdgeInsets.only(left: 10)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * .34,
              //backgroundColor: AppColors.PRIMARY_COLOR,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: BannerCarousel.fullScreen(
                        animation: true,
                        height: MediaQuery.of(context).size.height * .34,
                        activeColor: widget.product.images.length <= 1
                            ? Colors.transparent
                            : AppColors.PRIMARY_COLOR,
                        customizedBanners: [
                          ...widget.product.images.map((e) =>
                              CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: e,
                                height: MediaQuery.of(context).size.height * .5,
                                width: double.infinity,
                                placeholder: (context, url) => Image.asset(
                                  'assets/images/placeholder.jpg',
                                  height:
                                      MediaQuery.of(context).size.height * .5,
                                  width: double.infinity,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/placeholder.jpg',
                                  height:
                                      MediaQuery.of(context).size.height * .5,
                                  width: double.infinity,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              DescriptionSection(
                product: widget.product,
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Text(
                  'Rate The Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: RatingBar.builder(
                  minRating: .5,

                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {
                    print(value);
                  },
                  //itemSize: 20,
                  allowHalfRating: true,
                  initialRating: 0,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CartButtonsSection(
          onPress: () {},
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PhotosSection extends StatefulWidget {
  const PhotosSection({super.key});

  @override
  State<PhotosSection> createState() => _PhotosSectionState();
}

class _PhotosSectionState extends State<PhotosSection> {
  final List<String> imgList = [
    'https://thumbs.dreamstime.com/z/skin-care-product-ad-template-beauty-product-ad-concept-natural-skincare-dropper-bottle-mock-ups-set-wooden-background-193848710.jpg',
    'https://cgifurniture.com/wp-content/uploads/2020/11/types-of-product-advertising-View05.jpg',
    'https://i.ytimg.com/vi/rBKkPsqHijY/maxresdefault.jpg',
    'https://s3.amazonaws.com/media.mediapost.com/dam/cropped/2019/12/06/screenshot-2019-12-05-at-23107-pm_kKdoMd4.png',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imgList
              .map((item) => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(item, fit: BoxFit.fill)),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: .9,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.5,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      SizedBox(height: 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (_current == entry.key
                          ? Theme.of(context).primaryColor
                          : Colors.black)
                      // Theme.of(context).primaryColor
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

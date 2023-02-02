import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Home/presentation/screens/home_screen.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages.addAll([
      const HomeScreen(),
      Container(),
      Container(),
      Container(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: FancyBottomBar(
        type: FancyType.FancyV1,
        items: [
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Home',
            icon: Icon(Icons.home),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Favorite',
            icon: Icon(Icons.favorite_rounded),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Search',
            icon: Icon(Icons.search),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Account',
            icon: Icon(Icons.person),
          ),
        ],
        onItemSelected: (index) {
          goToPage(index);
          print(index);
        },
      ),
    );
  }

  Future<void> goToPage(int page) async {
    setState(() {
      _currentIndex = page;
    });
  }

  Future<bool> onWillPop() async {
    if (_currentIndex == 0) {
      return Future.value(true);
    } else {
      goToPage(0);
      return Future.value(false);
    }
  }
}

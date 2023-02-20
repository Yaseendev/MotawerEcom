import 'package:ecommerce/Account/presentation/screens/account_screen.dart';
import 'package:ecommerce/Search/presentation/screens/search_screen.dart';
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
  String? searchTerm;
  final GlobalKey<FancyBottomBarState> _key = GlobalKey<FancyBottomBarState>();
  @override
  void initState() {
    _pages.addAll([
      HomeScreen(onSearch: (term) {
        _pages.replaceRange(2, 3, [SearchScreen(searchTerm: term)]);
      
        _key.currentState!.setItem(2);
        setState(() {
          _currentIndex = 2;
        });
      }),
      Container(),
      SearchScreen(searchTerm: searchTerm),
      const AccountScreen(),
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
        key: _key,
        selectedIndex: _currentIndex,
        type: FancyType.FancyV1,
        items: [
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Home',
            icon: const Icon(Icons.home),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Favorite',
            icon: const Icon(Icons.favorite_rounded),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Search',
            icon: const Icon(Icons.search),
          ),
          FancyItem(
            textColor: Theme.of(context).primaryColor,
            title: 'Account',
            icon: const Icon(Icons.person),
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

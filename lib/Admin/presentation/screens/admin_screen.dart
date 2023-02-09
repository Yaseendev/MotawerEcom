import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';

import 'posts_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages.addAll([
      PostsScreen(),
      const Center(
        child: Text('Analytics Page'),
      ),
      const Center(
        child: Text('Cart Page'),
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .scaffoldBackgroundColor, //AppColors.PRIMARY_COLOR,
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child:
                  CircleAvatar(child: Image.asset('assets/images/appLogo.jpg')),
            ),
            SizedBox(width: 10),
            Text(
              'Al Motawer',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Admin',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
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
            icon: const Icon(Icons.home),
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

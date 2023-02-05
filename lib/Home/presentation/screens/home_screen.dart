import 'package:ecommerce/Home/presentation/widgets/loaded/home_loaded_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 5)).then((value) => false);
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: HomeLoadedWidget(),
        )),
        //  ListView(
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   //crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     //HomeLoadingWidget(),
        //     HomeLoadedWidget(),
        //     SizedBox(height: 30),
        //   ],
        // ),
      ),
    );
  }
}

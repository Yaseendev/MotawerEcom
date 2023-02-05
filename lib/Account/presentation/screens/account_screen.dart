import 'dart:math';

import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/account_screen_items.dart';
import '../widgets/user_inf0_items.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 25,
            left: 8,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/default_profile.png',
                  width: 90.sp,
                  height: 90.sp,
                ),
              ),
              SizedBox(height: 10),
              TextButton.icon(
                icon: const Icon(Icons.login),
                label: Text(
                  // 'Login',
                  'User Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                },
              ),
              SizedBox(height: 20),
              UserInfoItems(),
              SizedBox(height: 20),
              AccountScreenItems(),
              SizedBox(height: 20),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.PRIMARY_COLOR,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text('Log Out'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

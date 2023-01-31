import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizerUtil.orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 45.sp,
                        foregroundImage:
                            AssetImage('assets/images/appLogo.jpg'),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
SingupForm(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.sp,
                            foregroundImage:
                                AssetImage('assets/images/appLogo.jpg'),
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Al Motawer',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(),
                  ],
                ),
        ),
      ),
    );
  }
}

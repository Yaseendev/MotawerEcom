import 'package:custom_text/custom_text.dart';
import 'package:ecommerce/Home/presentation/screens/home_screen.dart';
import 'package:ecommerce/Primary/presentation/screens/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool passwordVisible = true;

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
                      'Login',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              hintText: 'E-mail',
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            //autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            onChanged: (value) => email = value,
                            validator: (value) {
                              return !GetUtils.isEmail(value ?? '')
                                  ? 'Please enter a valid email'
                                  : null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              hintText: 'Password',
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: passwordVisible
                                  ? IconButton(
                                      icon: const Icon(Icons.visibility),
                                      onPressed: () => setState(() {
                                        passwordVisible = false;
                                      }),
                                    )
                                  : IconButton(
                                      onPressed: () => setState(() {
                                        passwordVisible = true;
                                      }),
                                      icon: const Icon(Icons.visibility_off),
                                    ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            maxLines: 1,
                            onChanged: (value) => password = value,
                            obscureText: passwordVisible,
                            validator: (value) {
                              return value!.trim().isNotEmpty
                                  ? value.trim().length >= 8
                                      ? null
                                      : 'Password must be longer than 7 characters'
                                  : 'This field is required';
                            },
                          ),
                          SizedBox(height: 20),
                          LoginButton(
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        printInfo(info: 'Continue');
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => PrimaryScreen()));
                      },
                      child: Text('Continue as a visitor'),
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomText(
                      'Don\'t have an account?  [Sign Up]()',
                      definitions: [
                        SelectiveDefinition(
                          matcher: const LinkMatcher(),
                          labelSelector: (groups) => groups[0]!,
                        ),
                      ],
                      matchStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      onTap: (_, text) => print('Tapped'),
                    ),
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
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  hintText: 'E-mail',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                //autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                onChanged: (value) => email = value,
                                validator: (value) {
                                  return !GetUtils.isEmail(value ?? '')
                                      ? 'Please enter a valid email'
                                      : null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: passwordVisible
                                      ? IconButton(
                                          icon: const Icon(Icons.visibility),
                                          onPressed: () => setState(() {
                                            passwordVisible = false;
                                          }),
                                        )
                                      : IconButton(
                                          onPressed: () => setState(() {
                                            passwordVisible = true;
                                          }),
                                          icon:
                                              const Icon(Icons.visibility_off),
                                        ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                maxLines: 1,
                                onChanged: (value) => password = value,
                                obscureText: passwordVisible,
                                validator: (value) {
                                  return value!.trim().isNotEmpty
                                      ? value.trim().length >= 8
                                          ? null
                                          : 'Password must be longer than 7 characters'
                                      : 'This field is required';
                                },
                              ),
                              SizedBox(height: 20),
                              LoginButton(
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

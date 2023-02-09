import 'package:custom_text/custom_text.dart';
import 'package:ecommerce/Account/blocs/account_bloc/account_bloc.dart';
import 'package:ecommerce/Admin/presentation/screens/admin_screen.dart';
import 'package:ecommerce/Primary/presentation/screens/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';
import '../widgets/account_button.dart';
import 'signup_screen.dart';

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
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.error,
                color: Colors.white,
              ),
              title: Text(
                state.msg ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            duration: const Duration(seconds: 2),
          ));
        } else if (state is AccountLoggedIn) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => state.user.type == 'admin'
                  ? AdminScreen()
                  : PrimaryScreen()));
        }
      },
      child: Scaffold(
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                                            icon: const Icon(
                                                Icons.visibility_off),
                                          ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  maxLines: 1,
                                  onChanged: (value) => password = value,
                                  obscureText: passwordVisible,
                                  validator: (value) {
                                    return value!.trim().isNotEmpty
                                        ? value.trim().length > 6
                                            ? null
                                            : 'Password must be longer than 6 characters'
                                        : 'This field is required';
                                  },
                                ),
                                SizedBox(height: 20),
                                BlocBuilder<AccountBloc, AccountState>(
                                  builder: (context, state) {
                                    return AccountButton(
                                      buttonState: state is AccountLoading
                                          ? ButtonState.loading
                                          : ButtonState.idle,
                                      label: 'Login',
                                      onPress: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<AccountBloc>()
                                              .add(SingInEvent(
                                                email: email,
                                                password: password,
                                              ));
                                        }
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    printInfo(info: 'Continue');
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => PrimaryScreen()));
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
                                  matchStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  onTap: (_, text) => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (_) => SignupScreen())),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                                            icon: const Icon(
                                                Icons.visibility_off),
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
                                AccountButton(
                                  label: 'Login',
                                  onPress: () {
                                    if (_formKey.currentState!.validate())
                                      context
                                          .read<AccountBloc>()
                                          .add(SingInEvent(
                                            email: email,
                                            password: password,
                                          ));
                                  },
                                ),
                                SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    printInfo(info: 'Continue');
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => PrimaryScreen()));
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
                                  matchStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  onTap: (_, text) => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (_) => SignupScreen())),
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
      ),
    );
  }
}

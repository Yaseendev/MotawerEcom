import 'package:flutter/material.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFFDF291C);
  // ignore: non_constant_identifier_names
  static final MaterialColor PRIMARY_SWATCH =
      MaterialColor(AppColors.PRIMARY_COLOR.value, <int, Color>{
    50: PRIMARY_COLOR,
    100: PRIMARY_COLOR,
    200: PRIMARY_COLOR,
    300: PRIMARY_COLOR,
    400: PRIMARY_COLOR,
    500: PRIMARY_COLOR,
    600: PRIMARY_COLOR,
    700: PRIMARY_COLOR,
    800: PRIMARY_COLOR,
    900: PRIMARY_COLOR,
  });
}

class Urls {                    //<Your_ip_address>
  static const String DOMAIN = 'http://192.168.1.101:3000';
  static const String BASE_API = DOMAIN + '/api';
  static const String SIGNUP_API = BASE_API + '/signup';
  static const String SIGNIN_API = BASE_API + '/signin';
  static const String TOKEN_API = BASE_API + '/tokencheck';
}

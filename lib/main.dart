import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'Account/blocs/account_bloc/account_bloc.dart';
import 'Splash/blocs/bloc/initroute_bloc.dart';
import 'Splash/presentation/screens/splash_screen.dart';
import 'Utils/constants.dart';
import 'Utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await locatorsSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
        providers: [
          BlocProvider<AccountBloc>(
            create: (context) => AccountBloc(),
          ),
          BlocProvider<InitrouteBloc>(
            create: (context) => InitrouteBloc()..add(UserCheckEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'E-commerce',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.PRIMARY_SWATCH,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

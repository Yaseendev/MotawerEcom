import 'package:ecommerce/Account/presentation/screens/login_screen.dart';
import 'package:ecommerce/Splash/blocs/bloc/initroute_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitrouteBloc, InitrouteState>(
      listener: (context, state) {
          print(state);
        // TODO: implement listener
        if (state is InitrouteNoToken) {
          print('Going home');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: '/primary'),
              builder: (ctx) {
                return LoginScreen();
              }));
        }
      },
      child: Scaffold(body: Container()), //TODO: implement splash widget
    );
  }
}

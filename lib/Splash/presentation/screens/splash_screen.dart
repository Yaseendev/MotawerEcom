import 'package:ecommerce/Account/blocs/account_bloc/account_bloc.dart';
import 'package:ecommerce/Account/presentation/screens/login_screen.dart';
import 'package:ecommerce/Admin/logic/products_bloc/products_bloc.dart';
import 'package:ecommerce/Admin/presentation/screens/admin_screen.dart';
import 'package:ecommerce/Primary/presentation/screens/primary_screen.dart';
import 'package:ecommerce/Search/bloc/search_bloc.dart';
import 'package:ecommerce/Splash/blocs/bloc/initroute_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InitrouteBloc, InitrouteState>(
          listener: (context, state) {
            print(state);
            // TODO: implement listener
            if (state is InitrouteNoToken) {
              print('Going home');
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  settings: RouteSettings(name: '/login'),
                  builder: (ctx) {
                    return LoginScreen();
                  }));
            }
            if (state is InitrouteValidToken) {
              context.read<AccountBloc>().add(LoadUserProfileEvent());
            }
          },
          //TODO: implement splash widget
        ),
        BlocListener<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is AccountLoggedIn) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  settings: RouteSettings(name: '/primary'),
                  builder: (ctx) {
                    return BlocProvider<SearchBloc>(
                      create: (context) => SearchBloc(),
                      child: state.user.type == 'admin' ? BlocProvider<ProductsBloc>(
                            create: (context) =>
                                ProductsBloc()..add(FetchProducts()),
                            child: AdminScreen(),
                          )
                        : PrimaryScreen(),
                    );
                  }));
            }
          },
        ),
      ],
      child: Scaffold(body: Container()),
    );
  }
}

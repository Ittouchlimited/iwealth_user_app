import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinext/app/bloc/cards_and_balances_cubit/cards_and_balances_cubit.dart';
import 'package:pinext/app/bloc/userBloc/user_bloc.dart';

import 'app/app_data/routing/routes.dart';
import 'app/app_data/theme_data/theme.dart';
import 'app/bloc/signup_cubit/signin_cubit_cubit.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  Stripe.publishableKey =
      "pk_test_51LrmnJHVxrxbTWU0yIAQ8s9l2b7EPfhy334aNWR7pmCXHQgVLIySvAGLi5turbbr7kKHG9eA9eKl6Ap2NBG3xDFe00o1UoI7dk";

  runApp(const Pinext());
}

class Pinext extends StatelessWidget {
  const Pinext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("Running in master branch!");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninCubit(),
        ),
        BlocProvider(
          create: (context) => CardsAndBalancesCubit(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: ROUTECONTROLLER.routeController,
        initialRoute: ROUTES.getSplashRoute,
        theme: PinextTheme.lightTheme,
      ),
    );
  }
}
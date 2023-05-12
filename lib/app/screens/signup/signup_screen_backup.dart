import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/theme_data/colors.dart';
import 'package:pinext/app/bloc/signup_cubit/signin_cubit_cubit.dart';
import 'package:pinext/app/screens/signup/pages/cards_and_balance_registration_page.dart';

import 'pages/user_registration_page.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupScreenView();
  }
}

class SignupScreenView extends StatefulWidget {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  State<SignupScreenView> createState() => _SignupScreenViewState();
}

class _SignupScreenViewState extends State<SignupScreenView> {
  List registrationPages = [];

  late TextEditingController monthlyBudgetController;
  late TextEditingController budgetSpentSoFarController;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController numberController;
  late TextEditingController filesController;
  late TextEditingController addressController;
  late TextEditingController userRangeController;

  late PageController signupPageController;

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    monthlyBudgetController = TextEditingController();
    budgetSpentSoFarController = TextEditingController();
    numberController = TextEditingController();
    addressController = TextEditingController();
    filesController = TextEditingController();
    userRangeController = TextEditingController();
    signupPageController = PageController();

    registrationPages.add(
      UserRegistrationPage(
        //budgetSpentSoFarController: budgetSpentSoFarController,
        //monthlyBudgetController: monthlyBudgetController,
        emailController: emailController,
        userNameController: userNameController,
        passwordController: passwordController,
        //numberController: numberController,
        //addressController: addressController,
        //filesController: filesController,
        //userRangeController: userRangeController,
        pageController: signupPageController,
      ),
    );
    registrationPages.add(
      CardsAndBalancesRegistrationPage(
        budgetSpentSoFarController: budgetSpentSoFarController,
        monthlyBudgetController: monthlyBudgetController,
        emailController: emailController,
        userNameController: userNameController,
        passwordController: passwordController,
        numberController: numberController,
        addressController: addressController,
        filesController: filesController,
        userRangeController: userRangeController,
        pageController: signupPageController,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    monthlyBudgetController.dispose();
    budgetSpentSoFarController.dispose();
    numberController.dispose();
    addressController.dispose();
    filesController.dispose();
    userRangeController.dispose();
    signupPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<SigninCubit>().reset();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: customBlackColor,
          ),
        ),
      ),
      body: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          return PageView.builder(
            controller: signupPageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: registrationPages.length,
            itemBuilder: ((context, index) {
              return registrationPages[index];
            }),
          );
        },
      ),
    );
  }
}

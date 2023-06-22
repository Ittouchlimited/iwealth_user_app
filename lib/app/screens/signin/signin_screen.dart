import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/app_data/custom_transition_page_route/custom_transition_page_route.dart';
import 'package:pinext/app/app_data/extensions/string_extensions.dart';
import 'package:pinext/app/app_data/routing/routes.dart';
import 'package:pinext/app/bloc/signin_cubit/login_cubit.dart';
import 'package:pinext/app/bloc/userBloc/user_bloc.dart';
import 'package:pinext/app/shared/widgets/custom_snackbar.dart';
import 'package:pinext/app/shared/widgets/socials_button.dart';

import '../../app_data/app_constants/constants.dart';
import '../../app_data/app_constants/domentions.dart';
import '../../app_data/theme_data/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';

// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/view/auth/signup_screen.dart';
import 'package:pinext/view/tab_screen.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:pinext/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const SigninScreenView(),
    );
  }
}

class SigninScreenView extends StatefulWidget {
  const SigninScreenView({Key? key}) : super(key: key);

  @override
  State<SigninScreenView> createState() => _SigninScreenViewState();
}

class _SigninScreenViewState extends State<SigninScreenView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  //New UI Start
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                key: _formKey,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top + 20),
                      Container(
                        height: 80,
                        width: 240,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              DefaultImages.iwealthappIcon,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sign in to your account",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: HexColor(AppTheme.secondaryColorString!),
                        ),
                      ),
                      const SizedBox(height: 40),

                      CustomTextFormFieldTwo(
                        controller: emailController,
                        hintTitle: "Email address",
                        onChanged: (String value) {},
                        validator: (value) {
                          return InputValidation(value.toString())
                              .isCorrectEmailAddress();
                        },
                        suffixButtonAction: () {},
                        /*
                        controller: emailController,
                        hintText: "Email",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.email,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                        */
                      ),



                      const SizedBox(height: 5),

                      CustomTextFormFieldTwo(
                        controller: passwordController,
                        hintTitle: "Password",
                        isPassword: true,
                        onChanged: (String value) {},
                        validator: (value) {
                          return InputValidation(value).isNotEmpty();
                        },
                        suffixButtonAction: () {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),



/*
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const Padding(
                          padding: EdgeInsets.all(12.0),
                          /*child: SvgPicture.asset(
                            DefaultImages.eye,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),*/
                        ),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,
                      ),
*/


                      const SizedBox(height: 20),
                      BlocListener<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is AuthenticatedUserState) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              ROUTES.getHomeframeRoute,
                                  (route) => false,
                            );
                            GetCustomSnackbar(
                              title: "Successfully Signed In!",
                              message:
                              "Welcome back boss, we are now connected to iWealth....",
                              snackbarType: SnackbarType.info,
                              context: context,
                            );
                          }
                        },
                        child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              context.read<UserBloc>().add(RefreshUserStateEvent());
                            }
                            if (state is LoginErrorState) {
                              GetCustomSnackbar(
                                title: "Snap",
                                message: state.errorMessage,
                                snackbarType: SnackbarType.error,
                                context: context,
                              );
                              context.read<LoginCubit>().resetState();
                            }
                          },

                          builder: (context, state) {
                            return GetCustomButton(
                              title: "Sign In",
                              titleColor: whiteColor,
                              buttonColor: customBlueColor,
                              isLoading: state
                              is LoginWithEmailAndPasswordButtonLoadingState,
                              callBackFunction: () {
                                if (_formKey.currentState!.validate()) {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    context
                                        .read<LoginCubit>()
                                        .loginWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  } else {
                                    GetCustomSnackbar(
                                      title: "Snap",
                                      message:
                                      "We need your email and password in order to sign you in!",
                                      snackbarType: SnackbarType.info,
                                      context: context,
                                    );
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),





                      //Button goes here


        /*
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Sign In",
                        onTap: () {
                          Get.offAll(
                            const TabScreen(),
                            //transition: Transition.rightToLeft,
                          );
                        },
                      ),


                      */


                      /*
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          "Forgot password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: HexColor(AppTheme.primaryColorString!),
                          ),
                        ),
                      ),


                       */



                      //Sign in with Socials
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          "Or Sign in with Google",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      //SizedBox(height: MediaQuery.of(context).padding.left + 20),
                      Center(
                        child:
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                DefaultImages.googleLogo,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                    Navigator.pushNamed(context, ROUTES.getSignupRoute),
                  //const SignupScreen(),
                  //transition: Transition.rightToLeft,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: HexColor(AppTheme.secondaryColorString!),
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: HexColor(AppTheme.primaryColorString!),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  */
//New UI End



//Old UI Start

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        physics: const BouncingScrollPhysics(),
        child: Container(
          //height: 10,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          height: getHeight(context),
          width: getWidth(context),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  //'assets/images/iwealth_max.png',
                'assets/images/iwealthappIcon.png',
                  width: MediaQuery.of(context).size.width * 2.5,
                  //height: MediaQuery.of(context).padding.top - 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign In To Account",
                  style: boldTextStyle.copyWith(fontSize:20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Please sign in with your email and password\nto continue using the app.",
                  style: regularTextStyle.copyWith(
                    fontSize: 14,
                    color: customBlackColor.withOpacity(.6),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),



                //Email field start
                CustomTextFormField(
                  controller: emailController,
                  hintTitle: "Email address",
                  onChanged: (String value) {},
                  validator: (value) {
                    return InputValidation(value.toString())
                        .isCorrectEmailAddress();
                  },
                  suffixButtonAction: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                //Email field from functional part end



                //Password field from functional part start
                CustomTextFormField(
                  controller: passwordController,
                  hintTitle: "Password",
                  isPassword: true,
                  onChanged: (String value) {},
                  validator: (value) {
                    return InputValidation(value).isNotEmpty();
                  },
                  suffixButtonAction: () {},
                ),
               //Password field from functional part end



                //Add this Bloc listener when moving either fields from functional part
                const SizedBox(
                  height: 12,
                ),
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is AuthenticatedUserState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        ROUTES.getHomeframeRoute,
                        (route) => false,
                      );
                      GetCustomSnackbar(
                        title: "Successfully Signed In!",
                        message:
                            "Welcome back, you are now connected to iWealth....",
                        snackbarType: SnackbarType.info,
                        context: context,
                      );
                    }
                  },
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        context.read<UserBloc>().add(RefreshUserStateEvent());
                      }
                      if (state is LoginErrorState) {
                        GetCustomSnackbar(
                          title: "Snap",
                          message: state.errorMessage,
                          snackbarType: SnackbarType.error,
                          context: context,
                        );
                        context.read<LoginCubit>().resetState();
                      }
                    },
                    builder: (context, state) {
                      return GetCustomButton(
                        title: "Sign In",
                        titleColor: whiteColor,
                        buttonColor: customBlueColor,
                        isLoading: state
                            is LoginWithEmailAndPasswordButtonLoadingState,
                        callBackFunction: () {
                          if (_formKey.currentState!.validate()) {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context
                                  .read<LoginCubit>()
                                  .loginWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            } else {
                              GetCustomSnackbar(
                                title: "Snap",
                                message:
                                    "We need your email and password in order to sign you in!",
                                snackbarType: SnackbarType.info,
                                context: context,
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                ),

                //Add this Bloc listener when moving either fields from functional part



//Sign in with socials UI starts here
          /*
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Or sign in with socials",
                  style: regularTextStyle.copyWith(
                    fontSize: 14,
                    color: customBlackColor.withOpacity(.6),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SocialsButton(),




                */
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ROUTES.getSignupRoute);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: regularTextStyle.copyWith(
                            fontSize: 14,
                            color: customBlackColor.withOpacity(.6),
                          ),
                        ),
                        TextSpan(
                          text: "Sign up",
                          style: boldTextStyle.copyWith(
                            fontSize: 14,
                            color: customBlueColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )

                //Sign in with socials UI starts here
              ],
            ),
          ),






        ),
      ),
    );
  }

//Old UI end






}

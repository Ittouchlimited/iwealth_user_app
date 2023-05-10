// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final spalshController = Get.put(SplashController());
  @override
  void initState() {
    spalshController.customInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    DefaultImages.iwealthSquareappIcon,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

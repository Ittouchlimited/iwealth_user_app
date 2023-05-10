import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinext/app/app_data/app_constants/constants.dart';
import 'package:pinext/app/app_data/app_constants/fonts.dart';
import 'package:pinext/app/screens/goals_and_milestones/view_goals_and_milestones_screen.dart';
import 'package:pinext/app/screens/silver/silver_screen.dart';
import 'package:pinext/app/services/handlers/app_handler.dart';

import '../../app_data/appVersion.dart';
import '../../app_data/app_constants/domentions.dart';
import '../../app_data/custom_transition_page_route/custom_transition_page_route.dart';
import '../../app_data/theme_data/colors.dart';
import '../../services/handlers/user_handler.dart';



import 'dart:core';
import 'dart:math';

import 'package:flutter/animation.dart';

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    //t from 0.0 to 1.0
    return sin(t * 2.5 * pi).abs();
  }
}
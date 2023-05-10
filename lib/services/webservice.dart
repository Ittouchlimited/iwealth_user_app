// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
import 'package:pinext/models/stock.dart';
import 'package:pinext/view/market/buy_bottomsheet.dart';
import 'package:pinext/view/market/share_sheet.dart';
import 'package:pinext/view/market/transaction_view.dart';
import 'package:pinext/widget/back_icon.dart';
import 'package:pinext/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import 'package:pinext/models/stock.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Stock>> getStocks() async {

    const url = "https://silicon-rhinoceros.glitch.me/stocks";

    final response = await http.get(url as Uri);
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((stock) => Stock.fromJson(stock)).toList();
    } else {
      throw Exception("Error fetching stocks");
    }
  }
}
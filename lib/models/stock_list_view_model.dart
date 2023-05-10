// ignore_for_file: deprecated_member_use

import 'package:pinext/config/images.dart';
import 'package:pinext/config/textstyle.dart';
import 'package:pinext/controller/home_controller.dart';
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


import 'package:flutter/material.dart';
import 'package:pinext/models/stock.dart';
import 'package:pinext/services/webservice.dart';

class StockListViewModel extends ChangeNotifier {

  List<StockViewModel> stocks = <StockViewModel>[];
  List<StockViewModel> allStocks = <StockViewModel>[];

  Future<void> fetchStocks() async {
    final result = await Webservice().getStocks();
    stocks = result.map((stock) => StockViewModel(stock: stock)).toList();
    allStocks = stocks;
    notifyListeners();
  }

  void search(String searchTerm) {

    if(searchTerm.isEmpty) {
      stocks = allStocks;
    } else {
      stocks = allStocks.where((stock) => stock.symbol.startsWith(searchTerm)).toList();
    }
    notifyListeners();
  }

}

class StockViewModel {
  final Stock stock;

  StockViewModel({required this.stock});

  String get symbol {
    return stock.symbol.toUpperCase();
  }

  String get company {
    return stock.company;
  }

  double get price {
    return stock.price;
  }

  String get change {
    return stock.change;
  }
}
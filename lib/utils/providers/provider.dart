import 'package:pinext/view_models/company_provider.dart';
import 'package:pinext/view_models/theme_provider.dart';
import 'package:pinext/view_models/trades_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => CompanyProvider()),
  ChangeNotifierProvider(create: (_) => TradeProvider()),
  ChangeNotifierProvider(create: (_) => AppProvider()),
];

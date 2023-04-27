part of 'portfolio_cubit.dart';

abstract class PortfolioState extends Equatable {
  PortfolioState(
      {required this.selectedMonth,
      required this.selectedFilter,
      required this.selectedYear});
  String selectedMonth;
  String selectedYear;
  String selectedFilter;

  @override
  List<Object> get props => [selectedMonth, selectedFilter, selectedYear];
}

class PortfolioInitialState extends PortfolioState {
  PortfolioInitialState({
    required super.selectedMonth,
    required super.selectedFilter,
    required super.selectedYear,
  });
}

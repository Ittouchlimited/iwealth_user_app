part of 'export_cubit.dart';

abstract class ExportState extends Equatable {
  ExportState(
      {required this.selectedMonth,
      required this.selectedFilter,
      required this.selectedYear});
  String selectedMonth;
  String selectedYear;
  String selectedFilter;

  @override
  List<Object> get props => [selectedMonth, selectedFilter, selectedYear];
}

class ExportInitialState extends ExportState {
  ExportInitialState({
    required super.selectedMonth,
    required super.selectedFilter,
    required super.selectedYear,
  });
}

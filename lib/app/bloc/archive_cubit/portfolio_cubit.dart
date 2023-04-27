import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinext/app/services/date_time_services.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit()
      : super(
          PortfolioInitialState(
            selectedMonth: (int.parse(
                      DateTime.now().toString().substring(5, 7),
                    ) -
                    1)
                .toString(),
            selectedFilter: "All transactions",
            selectedYear: currentYear,
          ),
        );

  changeMonth(String selectedMonth) {
    emit(
      PortfolioInitialState(
        selectedMonth: selectedMonth,
        selectedFilter: "All transactions",
        selectedYear: state.selectedYear,
      ),
    );
  }

  changeFilter(String selectedFilter) {
    emit(
      PortfolioInitialState(
          selectedMonth: state.selectedMonth,
          selectedFilter: selectedFilter,
          selectedYear: state.selectedYear),
    );
  }

  changeYear(String selectedYear) {
    log("Changing filter");
    emit(
      PortfolioInitialState(
          selectedMonth: state.selectedMonth,
          selectedFilter: state.selectedFilter,
          selectedYear: selectedYear),
    );
  }
}

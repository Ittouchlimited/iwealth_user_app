import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit()
      : super(
          HomepageInitialState(
            selectedFilter: 'Overview',
          ),
        );

  changeMenuFilter(String filterName) {
    emit(
      HomepageInitialState(
        selectedFilter: filterName,
      ),
    );
  }
}

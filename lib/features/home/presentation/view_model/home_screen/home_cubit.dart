
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int selectedIndex = 0;
  final PageController pageController = PageController();
  void onDestinationSelected(int? value) {
    selectedIndex = value!;
    pageController.jumpToPage(value);
    emit(HomeInitial());
  }

  void onPageChanged(int index) {
    selectedIndex = index;
    emit(HomeInitial());
  }
}

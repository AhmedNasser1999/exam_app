import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  late Timer _timer;
  Duration timeLeft = const Duration();
  void startTimer({required int time}) {
    timeLeft = Duration(minutes: time);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.inSeconds == 0) {
        emit(TimerFinish());
        timer.cancel();
      } else {
        timeLeft -= const Duration(seconds: 1);
        emit(TimerInitial());
      }
    });
  }
}

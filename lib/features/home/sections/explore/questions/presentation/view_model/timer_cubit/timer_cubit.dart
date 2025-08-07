import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'timer_state.dart';

@injectable
class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  Timer? _timer;
  Duration timeLeft = const Duration();
  bool _examFinish = false;
  void startTimer({required int time}) {
    _examFinish = false;
    _timer?.cancel();
    timeLeft = Duration(minutes: time);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.inSeconds == 0) {
        if (!isClosed) timerFinish();
      } else if (_examFinish) {
        if (!isClosed) _timer?.cancel();
      } else {
        timeLeft -= const Duration(seconds: 1);
        if (!isClosed) emit(TimerInitial());
      }
    });
  }

  timerFinish() {
    _examFinish = true;
    _timer?.cancel();
    emit(TimerFinish());
  }
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

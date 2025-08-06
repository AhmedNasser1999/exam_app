part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class TimerFinish extends TimerState {}

final class TimerStart extends TimerState {}

part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashHasToken extends SplashState {}

final class SplashNotHaveToken extends SplashState {}

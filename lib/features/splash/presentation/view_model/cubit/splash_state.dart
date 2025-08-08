part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashHasToken extends SplashState {}

final class SplashNotHaveToken extends SplashState {}

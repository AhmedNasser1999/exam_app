import 'package:bloc/bloc.dart';
import 'package:exam_app/features/splash/domain/use_case/get_token_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

@lazySingleton
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.getTokenUseCase) : super(SplashInitial());
  final GetTokenUseCase getTokenUseCase;
  userToken() async {
    emit(SplashInitial());
    await Future.delayed(const Duration(seconds: 3));
    final bool hasToken = await getTokenUseCase.call();
    if (hasToken) {
      emit(SplashHasToken());
    } else {
      emit(SplashNotHaveToken());
    }
  }
}

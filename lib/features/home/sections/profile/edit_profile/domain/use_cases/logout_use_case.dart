import 'package:exam_app/features/home/sections/profile/edit_profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutUseCase {
  final ProfileRepo _profileRepo;

  LogoutUseCase(this._profileRepo);
  Future<void> call() async {
    await _profileRepo.logout();
  }
}

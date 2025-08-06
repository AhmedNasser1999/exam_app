import 'package:exam_app/features/home/sections/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSource {
  static Future<void> saveProfileToPrefs(ProfileEntity profile) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', profile.username ?? '');
    await prefs.setString('firstName', profile.firstName ?? '');
    await prefs.setString('lastName', profile.lastName ?? '');
    await prefs.setString('email', profile.email ?? '');
    await prefs.setString('phone', profile.phone ?? '');
  }

  static Future<ProfileEntity> loadProfileFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    return ProfileEntity(
      username: prefs.getString('username') ?? '',
      firstName: prefs.getString('firstName') ?? '',
      lastName: prefs.getString('lastName') ?? '',
      email: prefs.getString('email') ?? '',
      phone: prefs.getString('phone') ?? '',
    );
  }
}

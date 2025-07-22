import 'package:injectable/injectable.dart';

@injectable
class User {
  final String token;

  User({required this.token});
}

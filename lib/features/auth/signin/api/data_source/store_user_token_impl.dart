import 'package:exam_app/core/local_data/user_cash_token.dart';
import 'package:exam_app/features/auth/signin/data/data_source/store_user_token.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StoreUserToken)
class StoreUserTokenImpl extends StoreUserToken {
  @override
  Future<void> saveToken({required String token}) async {
    await UserCashToken.saveToken(token: token);
  }
}

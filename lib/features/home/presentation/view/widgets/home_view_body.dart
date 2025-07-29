import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonModel: ButtonModel(
            text: "Logout",
            onPressed: () async {
              UserTokenStorage userTokenStorage = getIt<UserTokenStorage>();
              await userTokenStorage.removeToken();
              Navigator.pushReplacementNamed(context, SignInView.routeName);
            },
          ),
        ),
      ],
    );
  }
}

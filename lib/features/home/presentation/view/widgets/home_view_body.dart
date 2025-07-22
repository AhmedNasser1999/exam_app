import 'package:exam_app/core/local_data/user_cash_token.dart';
import 'package:exam_app/core/widgets/custom_text_button.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomTextButton(
            textButton: "Logout",
            onPressed: () async {
              await UserCashToken.removeToken();
              Navigator.pushReplacementNamed(context, SignInView.routeName);
            },
          ),
        ),
      ],
    );
  }
}

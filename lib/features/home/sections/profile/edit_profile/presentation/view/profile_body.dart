import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/local_data/secure_storage/user_token_storage.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final UserTokenStorage userTokenStorage = getIt<UserTokenStorage>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonModel: ButtonModel(
            text: "Logout",
            onPressed: () async {
              await userTokenStorage.removeToken();
              Navigator.pushReplacementNamed(context, SignInView.routeName);
            },
          ),
        ),
        const Center(child: Text(TextConstant.profileLabel)),
      ],
    );
  }
}

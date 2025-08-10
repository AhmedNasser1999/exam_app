import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final cubit = context.read<ProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(TextConstant.editProfile, style: theme.textTheme.titleLarge),
          IconButton(
            onPressed: () {
              cubit.logout();
              Navigator.pushReplacementNamed(context, SignInView.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRememberMeWidget extends StatelessWidget {
  const CustomRememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SignInCubit>();
    return Row(
      children: [
        BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return Checkbox(
              value: cubit.isRememberMe,
              onChanged: (value) {
                cubit.rememberMe();
              },
            );
          },
        ),
        Text(TextConstant.rememberMe, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

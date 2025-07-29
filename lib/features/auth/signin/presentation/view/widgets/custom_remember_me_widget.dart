import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/auth/signin/presentation/bloc/sign_in_view_model.dart';
import 'package:exam_app/features/auth/signin/presentation/bloc/sign_in_event.dart';
import 'package:exam_app/features/auth/signin/presentation/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRememberMeWidget extends StatelessWidget {
  const CustomRememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<SignInViewModel>();
    return Row(
      children: [
        BlocBuilder<SignInViewModel, SignInState>(
          builder: (context, state) {
            return Checkbox(
              value: bloc.isRememberMe,
              onChanged: (value) {
                bloc.add(SignInRememberMeEvent());
              },
            );
          },
        ),
        Text(TextConstant.rememberMe, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

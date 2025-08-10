import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/widgets/custom_snackbar.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view/widget/builder_profile_body.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_cubit.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenerProfileBody extends StatelessWidget {
  const ListenerProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdateLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProfileUpdateSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: TextConstant.profileUpdateSuccess,
                title: TextConstant.successTitle,
              ),
            );
        } else if (state is ProfileUpdateFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              customSnackBar(
                contentType: ContentType.success,
                message: state.errorMassage,
                title: TextConstant.successTitle,
              ),
            );
        }
      },
      child: const BuilderProfileBody(),
    );
  }
}

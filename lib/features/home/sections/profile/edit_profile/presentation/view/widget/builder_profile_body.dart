import 'package:exam_app/core/constant/app_assets.dart';
import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/core/custom_widgets_model/button_model.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view/widget/section_text_filed.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_cubit.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderProfileBody extends StatefulWidget {
  const BuilderProfileBody({super.key});

  @override
  State<BuilderProfileBody> createState() => _BuilderProfileBodyState();
}

class _BuilderProfileBodyState extends State<BuilderProfileBody> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileFailure) {
          return Center(child: Text(state.errorMassage));
        } else {
          return Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 81,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset(
                        AppAssets.imagesProfile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const SectionTextFiled(),
                  const SizedBox(height: 25.0),
                  CustomButton(
                    buttonModel: ButtonModel(
                      text: TextConstant.update,
                      onPressed: () {
                        cubit.formValidateOnEditProfile(key);
                      },
                      borderRadius: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view/widget/custom_profile_header.dart';
import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view/widget/listener_profile_body.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomProfileHeader(),
          SizedBox(height: 25.0),
          ListenerProfileBody(),
        ],
      ),
    );
  }
}

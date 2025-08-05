import 'package:exam_app/features/home/sections/profile/edit_profile/presentation/view/profile_body.dart';
import 'package:exam_app/features/home/sections/result/presentation/view/all_results_exams_view.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view/subject_exam_body.dart';
import 'package:exam_app/features/home/presentation/view_model/home_screen/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: PageView(
            controller: cubit.pageController,
            onPageChanged: cubit.onPageChanged,
            children: const [
              SubjectExamBody(),
              AllResultsView(),
              ProfileBody(),
            ],
          ),
        );
      },
    );
  }
}



// to logout
        // Center(
        //   child: CustomTextButton(
        //     textButton: "Logout",
        //     onPressed: () async {
        //       await UserCashToken.removeToken();
        //       Navigator.pushReplacementNamed(context, SignInView.routeName);
        //     },
        //   ),
        // ),
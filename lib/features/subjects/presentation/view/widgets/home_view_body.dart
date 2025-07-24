import 'package:exam_app/features/subjects/presentation/view/widgets/profile_exam_body.dart';
import 'package:exam_app/features/subjects/presentation/view/widgets/results_exam_body.dart';
import 'package:exam_app/features/subjects/presentation/view/widgets/subject_exam_body.dart';
import 'package:exam_app/features/subjects/presentation/view_model/home_screen/home_cubit.dart';
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
              ResultsExamBody(),
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
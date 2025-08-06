import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/view/sign_in_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view/sign_up_view.dart';
import 'package:exam_app/features/auth/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view/all_exam_view.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view/quiz_exam_view.dart';
import 'package:exam_app/features/home/presentation/view/home_view.dart';
import 'package:exam_app/features/home/presentation/view_model/home_screen/home_cubit.dart';
import 'package:exam_app/features/home/sections/explore/exams/presentation/view_model/cubit/fetch_exam_all_by_id_cubit.dart';
import 'package:exam_app/features/home/sections/explore/questions/presentation/view_model/cubit/exam_question_cubit.dart';
import 'package:exam_app/features/home/sections/explore/subjects/domain/entities/subject_entity.dart';
import 'package:exam_app/features/home/sections/explore/subjects/presentation/view_model/subjects/subjects_cubit.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/view_model/change_password_cubit.dart';
import 'package:exam_app/features/home/sections/profile/change_password/presentation/views/change_password_screen.dart';
import 'package:exam_app/features/splash/presentation/view/splash_view.dart';
import 'package:exam_app/features/splash/presentation/view_model/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late final SubjectEntity subjectEntity;

abstract class OnGenerateRoute {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.splashView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashView(),
          ),
        );

      case RouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(
                create: (context) => getIt<SubjectsCubit>()..fetchSubjects(),
              ),
            ],
            child: const HomeView(),
          ),
        );

      case RouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<ForgetPasswordCubit>(),
            child: ForgetPasswordView(),
          ),
        );

      case RouteName.sigInName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<SignInCubit>(),
            child: const SignInView(),
          ),
        );

      case RouteName.signUpName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<SignupCubit>(),
            child: const SignUpView(),
          ),
        );

      case RouteName.allExamView:
        final subjectId = setting.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<FetchExamAllByIdCubit>()
                  ..getAllExamsOnSubject(subjectId: subjectId),
            child: const AllExamView(),
          ),
        );

      case RouteName.quizExamView:
        final ExamEntity examInfo = setting.arguments as ExamEntity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<ExamQuestionCubit>()
                  ..getAllQuestions(examId: examInfo.id),
            child: QuizExamView(examInfoEntity: examInfo),
          ),
        );

      case RouteName.changePassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}

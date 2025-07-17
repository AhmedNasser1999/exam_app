import 'package:exam_app/core/route/route_name.dart';
import 'package:exam_app/core/widgets/custom_button.dart';
import 'package:exam_app/core/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_cubit.dart';
import 'package:exam_app/features/auth/signin/presentation/cubit/sign_in_state.dart';
import 'package:exam_app/features/auth/signin/presentation/view/hello_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  static const String routeName = RouteName.sigInName;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is SignInSuccess) {
            Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HelloScreen()),
            );
          } else if (state is SignInFailure) {
            Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },

        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 24.0),
                  CustomTextFormField(
                    controller: emailController,
                    label: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  SizedBox(height: 24.0),
                  CustomTextFormField(
                    controller: passwordController,
                    label: 'Password',
                    hintText: 'Enter Your Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Remember me', style: TextStyle(fontSize: 13.0)),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            fontSize: 13.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70.0),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      context.read<SignInCubit>().signIn(email, password);
                    },
                    borderRadius: 30.0,
                    backgroundColor: Color(0xff022D82),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? '),
                      TextButton(onPressed: () {}, child: Text('Sign up')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

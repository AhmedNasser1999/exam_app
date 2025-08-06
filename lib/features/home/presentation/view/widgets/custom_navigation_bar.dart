import 'dart:developer';

import 'package:exam_app/core/constant/text_constant.dart';
import 'package:exam_app/features/home/presentation/view_model/home_screen/home_cubit.dart';
import 'package:exam_app/features/home/sections/result/presentation/view_model/cubit/all_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<HomeCubit>();
    final resultCubit = context.read<AllResultCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => NavigationBar(
        selectedIndex: cubit.selectedIndex,
        onDestinationSelected: (value) {
          if (value == 1) {
            resultCubit.getAllResult();
          }
          cubit.onDestinationSelected(value);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: theme.colorScheme.primary),
            label: TextConstant.exploreLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_document, color: theme.colorScheme.primary),
            label: TextConstant.resultsLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: theme.colorScheme.primary),
            label: TextConstant.profileLabel,
          ),
        ],
      ),
    );
  }
}

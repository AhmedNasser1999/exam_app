import 'package:exam_app/core/constant/app_assets.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Image.asset(AppAssets.imagesLogo, width: screenWidth * 0.4),
          ),
        ),
      ],
    );
  }
}

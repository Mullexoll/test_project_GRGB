import 'package:flutter/material.dart';
import 'package:generate_rgb_project/domain/constants/app_consts.dart';
import 'package:generate_rgb_project/presentation/widgets/home_screen_widgets/buttons_widget.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Center(
          child: Text(
            AppConstants.mainText,
            style: TextStyle(
              fontFamily: 'Rubik Scribble',
              fontSize: AppConstants.mainTextFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: AppConstants.mainTextLetterSpacing,
            ),
          ),
        ),
        Spacer(),
        ButtonsWidget(),
      ],
    );
  }
}

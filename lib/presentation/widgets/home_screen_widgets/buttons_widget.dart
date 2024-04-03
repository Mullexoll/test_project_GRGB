import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generate_rgb_project/bloc/app_bloc.dart';
import 'package:generate_rgb_project/domain/constants/app_consts.dart';

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<AppBloc>(context).add(GradientUsed());
              BlocProvider.of<AppBloc>(context).add(NewColorGenerated());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Center(
                    child: Text(
                      'Use gradient',
                      style: TextStyle(
                        fontFamily: 'Rubik Scribble',
                        fontSize: AppConstants.buttonFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: AppConstants.checkboxWidth,
                    height: AppConstants.checkboxHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child:
                        (BlocProvider.of<AppBloc>(context).state as AppLoaded)
                                .isGradient
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

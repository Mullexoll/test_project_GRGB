import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generate_rgb_project/presentation/widgets/home_screen_widgets/color_widget.dart';

import '../../bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  final AppLoaded state;

  const HomeScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set background
      backgroundColor:
          state.isGradient ? Colors.transparent : state.generatedColor,
      body: InkWell(
        //add event for generate new color if user tapped on display
        onTap: () => BlocProvider.of<AppBloc>(context).add(
          NewColorGenerated(),
        ),
        child: state.isGradient
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: state.gradientColors, // Define your gradient colors
                  ),
                ),
                child: ColorWidget(),
              )
            : ColorWidget(),
      ),
    );
  }
}

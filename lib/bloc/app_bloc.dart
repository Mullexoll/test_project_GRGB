import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  Random random = Random();

  AppBloc()
      : super(
          const AppLoaded(
            generatedColor: Colors.white,
            isGradient: false,
            gradientColors: [],
          ),
        ) {
    on<InitializeApp>(_onInitializeApp);
    on<NewColorGenerated>(_onNewColorGenerated);
    on<GradientUsed>(_onGradientUsed);
  }

  FutureOr<void> _onInitializeApp(
    InitializeApp event,
    Emitter<AppState> emit,
  ) {
    emit(
      AppLoaded(
        generatedColor: getRandomColor(),
        isGradient: false,
        gradientColors: [],
      ),
    );
  }

  FutureOr<void> _onNewColorGenerated(
    NewColorGenerated event,
    Emitter<AppState> emit,
  ) {
    if ((state as AppLoaded).isGradient) {
      emit(
        (state as AppLoaded).copyWith(
          gradientColors:
              generateGradient(getRandomColor(), getRandomColor(), 10),
        ),
      );
    } else {
      emit(
        (state as AppLoaded).copyWith(
          generatedColor: getRandomColor(),
        ),
      );
    }
  }

  /// generate [int] for getting random number of colors pallete RGB
  Color getRandomColor() {
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    return Color.fromRGBO(red, green, blue, 1);
  }

  /// Generate random gradient colors list
  List<Color> generateGradient(Color startColor, Color endColor, int steps) {
    final List<Color> gradientColors = [];
    final double stepR = (endColor.red - startColor.red) / steps;
    final double stepG = (endColor.green - startColor.green) / steps;
    final double stepB = (endColor.blue - startColor.blue) / steps;

    for (int i = 0; i < steps; i++) {
      int red = (startColor.red + stepR * i).round();
      int green = (startColor.green + stepG * i).round();
      int blue = (startColor.blue + stepB * i).round();
      gradientColors.add(Color.fromARGB(255, red, green, blue));
    }

    gradientColors.add(endColor);
    return gradientColors;
  }

  FutureOr<void> _onGradientUsed(
    GradientUsed event,
    Emitter<AppState> emit,
  ) {
    emit(
      (state as AppLoaded).copyWith(
        isGradient: !(state as AppLoaded).isGradient,
      ),
    );
  }
}

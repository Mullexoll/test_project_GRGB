part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppLoaded extends AppState {
  final Color generatedColor;
  final bool isGradient;
  final List<Color> gradientColors;

  const AppLoaded({
    required this.generatedColor,
    required this.isGradient,
    required this.gradientColors,
  });

  AppLoaded copyWith({
    Color? generatedColor,
    bool? isGradient,
    List<Color>? gradientColors,
  }) {
    return AppLoaded(
      generatedColor: generatedColor ?? this.generatedColor,
      isGradient: isGradient ?? this.isGradient,
      gradientColors: gradientColors ?? this.gradientColors,
    );
  }

  @override
  List<Object> get props => [generatedColor, isGradient, gradientColors];
}

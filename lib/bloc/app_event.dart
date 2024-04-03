part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

/// Event using for first init application
class InitializeApp extends AppEvent {
  const InitializeApp();
}

/// Event for generate new random color
/// Single color or [List<Color>] for gradients
class NewColorGenerated extends AppEvent {
  const NewColorGenerated();
}

/// Event for check if gradient is used
class GradientUsed extends AppEvent {
  const GradientUsed();
}

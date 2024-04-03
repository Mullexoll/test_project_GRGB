import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generate_rgb_project/presentation/screens/home.screen.dart';

import 'bloc/app_bloc.dart';

void main() {
  runApp(const RGBGeneratorApp());
}

class RGBGeneratorApp extends StatelessWidget {
  const RGBGeneratorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //first init BLoC and added first event for generate color before loading HomeScreen
      create: (context) => AppBloc()..add(InitializeApp()),
      child: MaterialApp(
        title: 'Flutter RGB Generator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            //check if state is loaded
            if (state is AppLoaded) {
              return HomeScreen(
                state: state,
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

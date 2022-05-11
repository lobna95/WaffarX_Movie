// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '/model/movie_details_screen_arguments.dart';
import 'ui/screens/main_screen.dart';
import '/bloc/movie_bloc.dart';
import 'ui/screens/movie_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetailsScreen.routeName) {
          final args = settings.arguments as MovieDetailsScreenArgument;

          return MaterialPageRoute(
            builder: (context) {
              return MovieDetailsScreen(
                movieID: args.movieID,
              );
            },
          );
        }
      },
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Movie App")),
          ),
          body: SafeArea(child: HomeScreen())),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            MovieBloc(httpClient: http.Client())..add(MovieFetched()),
        child: MoviesScreen());
  }
}

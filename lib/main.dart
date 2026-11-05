import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/movie_details/screens/movie_details_screen.dart';
import 'features/movie_details/providers/movie_details_provider.dart';
import 'features/library/providers/library_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LibraryProvider(),
        ),
      ],
      child: const MoviesApp(),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121312),
        fontFamily: 'Roboto',
      ),
      home: const MovieDetailsScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/api/api_manager.dart';
import '../../../core/models/movie_model.dart';

class HomeProvider extends ChangeNotifier {
  List<MovieModel> availableNowMovies = [];
  List<MovieModel> actionMovies = [];
  bool isLoading = true;

  HomeProvider() {
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    isLoading = true;
    notifyListeners();

    try {
      availableNowMovies = await ApiManager.getMovies(limit: 5, sortBy: 'year');
      actionMovies = await ApiManager.getMovies(limit: 10, genre: 'Action');
      debugPrint('Fetched Movies Count: ${availableNowMovies.length}');
    } catch (e) {
      debugPrint('HomeProvider Error: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class LibraryProvider extends ChangeNotifier {
  // Movies saved in Watchlist
  final List<Map<String, dynamic>> watchlist = [];

  // Movies watched by the user
  final List<Map<String, dynamic>> history = [];

  // Add movie to Watchlist
  void addToWatchlist(Map<String, dynamic> movie) {
    final movieId = movie['id'];

    final isExist = watchlist.any(
          (item) => item['id'] == movieId,
    );

    if (!isExist) {
      watchlist.add(movie);
      notifyListeners();
    }
  }

  // Remove movie from Watchlist
  void removeFromWatchlist(dynamic movieId) {
    watchlist.removeWhere(
          (movie) => movie['id'] == movieId,
    );

    notifyListeners();
  }

  // Check if movie is saved
  bool isInWatchlist(dynamic movieId) {
    return watchlist.any(
          (movie) => movie['id'] == movieId,
    );
  }

  // Add movie to History
  void addToHistory(Map<String, dynamic> movie) {
    final movieId = movie['id'];

    history.removeWhere(
          (item) => item['id'] == movieId,
    );

    history.insert(0, movie);

    notifyListeners();
  }

  // Remove movie from History
  void removeFromHistory(dynamic movieId) {
    history.removeWhere(
          (movie) => movie['id'] == movieId,
    );

    notifyListeners();
  }
}
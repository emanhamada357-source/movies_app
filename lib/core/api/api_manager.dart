import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiManager {
  static const String baseUrl = 'https://movies-api.accel.li/api/v2';

  static Future<List<MovieModel>> getMovies({
    int limit = 20,
    int page = 1,
    String? genre,
    String? queryTerm,
    String sortBy = 'date_added',
  }) async {
    final Map<String, String> queryParams = {
      'limit': limit.toString(),
      'page': page.toString(),
      'sort_by': sortBy,
    };

    if (genre != null && genre.isNotEmpty) {
      queryParams['genre'] = genre;
    }
    if (queryTerm != null && queryTerm.isNotEmpty) {
      queryParams['query_term'] = queryTerm;
    }

    final Uri url = Uri.parse('$baseUrl/list_movies.json').replace(queryParameters: queryParams);

    try {
      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic>? moviesJson = data['data']['movies'];
        if (moviesJson != null) {
          return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
        }
      }
      return [];
    } catch (e) {
      debugPrint('API Fetch Error: $e');
      return [];
    }
  }

  // --- دالة البحث المباشرة لتسهيل الاستخدام في SearchProvider ---
  static Future<List<MovieModel>> searchMovies(String query) async {
    return getMovies(queryTerm: query);
  }
}
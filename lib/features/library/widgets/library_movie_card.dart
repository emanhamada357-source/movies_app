import 'package:flutter/material.dart';

class LibraryMovieCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const LibraryMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          // Movie Poster
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.network(
              movie['image'] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xff343534),
                  child: const Icon(
                    Icons.movie,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),

          // Rating
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${movie['rating'] ?? '0.0'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 3),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 13,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/models/movie_model.dart';
import 'movie_details_widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  List<Widget> _buildScreenshotsList() {
    final String firstImageUrl =
    (movie.screenshot1 != null && movie.screenshot1!.isNotEmpty)
        ? movie.screenshot1!
        : (movie.largeCoverImage.isNotEmpty
        ? movie.largeCoverImage
        : movie.mediumCoverImage);

    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            firstImageUrl,
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Image.asset(
              'assets/images/photo1.jpg',
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/photo1.jpg',
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/photo2.jpg',
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, String>> castList = [
      {
        'name': 'Hayley Atwell',
        'character': 'Captain Carter',
        'asset': 'assets/images/hayley.jpg',
      },
      {
        'name': 'Elizabeth Olsen',
        'character': 'Wanda Maximoff / The Scarlet Witch',
        'asset': 'assets/images/elizabeth.jpg',
      },
      {
        'name': 'Rachel McAdams',
        'character': 'Dr. Christine Palmer',
        'asset': 'assets/images/rachel.jpg',
      },
      {
        'name': 'Charlize Theron',
        'character': 'Clea',
        'asset': 'assets/images/charlize.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailsHeader(
              movie: movie,
              screenHeight: screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Text(
                      movie.year.toString(),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE50914),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Watch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  MovieStatsRow(movie: movie),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Screen Shots'),
                  const SizedBox(height: 12),
                  ..._buildScreenshotsList(),
                  const SizedBox(height: 14),
                  const SectionTitle(title: 'Similar'),
                  const SizedBox(height: 6),
                  SimilarMoviesSection(movie: movie),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Summary'),
                  const SizedBox(height: 10),
                  Text(
                    movie.summary.isNotEmpty
                        ? movie.summary
                        : 'Following the events of the movie, the main characters confront various challenges while navigating through incredible adventures.',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Cast'),
                  const SizedBox(height: 12),
                  ...castList.map(
                        (actor) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CastTile(
                        actorName: actor['name']!,
                        characterName: actor['character']!,
                        assetPath: actor['asset']!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Genres'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                    (movie.genres.isNotEmpty
                        ? movie.genres
                        : ['Action', 'Drama'])
                        .map(
                          (genre) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF282A28),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          genre,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




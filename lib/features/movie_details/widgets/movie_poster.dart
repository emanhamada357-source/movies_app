import 'package:flutter/material.dart';
class MoviePoster extends StatefulWidget {
  const MoviePoster({super.key});

  @override
  State<MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<MoviePoster> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
          height: 450,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 15,
          left: 15,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new ,
              color: Colors.white,
              size: 24,


            ),
          ),
        ),

        Positioned(
          top: 15,
          right: 15,
          child: IconButton(
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
              });
            },
            icon: Icon(
              isSaved
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),

        const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 65,
          ),
        ),
      ],
    );
  }
}
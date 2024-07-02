import 'package:cache_test/domain/movie_model.dart';
import 'package:flutter/material.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({
    super.key,
    required this.movieList,
  });

  final MovieList? movieList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: movieList!.results.length,
        itemBuilder: (context, index) {
          final movie = movieList!.results[index];
          final moviePosterUrl = movie.posterPath != null
              ? 'https://image.tmdb.org/t/p/w154/${movie.posterPath}'
              : "https://placehold.co/154x231.jpg";
          return Card(
            clipBehavior: Clip.antiAlias,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              child: Image.network(
                moviePosterUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
  }
}
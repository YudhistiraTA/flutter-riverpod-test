import 'package:cache_test/data/query_provider.dart';
import 'package:cache_test/domain/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    searchController.text = ref.read(queryProvider);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search movies',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            onSubmitted: (value) {
              ref.read(queryProvider.notifier).state = value;
            },
          ),
        ),
        const Padding(padding: EdgeInsets.all(4)),
        ElevatedButton.icon(
          label: const Text('Search'),
          icon: const Icon(Icons.search),
          onPressed: () {
            ref.read(queryProvider.notifier).state = searchController.text;
          },
        ),
      ],
    );
  }
}

class MovieScreen extends ConsumerWidget {
  final MovieList? movieList; // Make movieList nullable to handle loading state
  const MovieScreen({super.key, this.movieList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    searchController.text = ref.read(queryProvider);

    // Existing implementation for when movieList is not null
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SearchBar(),
            const Padding(padding: EdgeInsets.all(8)),
            Expanded(
              child: movieList == null
                  ? _buildShimmerLoadingState()
                  : GridView.builder(
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
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoadingState() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 6, // Number of shimmer items to show
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: GridTile(
              child: Container(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

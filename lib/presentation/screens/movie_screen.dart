import 'package:cache_test/domain/movie_model.dart';
import 'package:cache_test/presentation/widgets/movie_grid_widget.dart';
import 'package:cache_test/presentation/widgets/movie_skeleton_widget.dart';
import 'package:cache_test/presentation/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerWidget {
  final MovieList? movieList;
  const MovieScreen({super.key, this.movieList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SearchBarWidget(),
          const Padding(padding: EdgeInsets.all(8)),
          Expanded(
            child: movieList == null
                ? const MovieSkeleton()
                : MovieGrid(movieList: movieList),
          ),
        ],
      ),
    );
  }
}

import 'package:cache_test/data/movie_repository.dart';
import 'package:cache_test/data/query_provider.dart';
import 'package:cache_test/domain/movie_model.dart';
import 'package:cache_test/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final query = ref.watch(queryProvider);
        final AsyncValue<MovieList> movie = ref.watch(movieProvider(query));
        return MaterialApp(
          home: SafeArea(
            child: Center(
              child: switch (movie) {
                AsyncData(:final value) => MovieScreen(movieList: value),
                AsyncError() => const Scaffold(
                    body: Center(
                        child: Text('Oops, something unexpected happened'))),
                _ => const MovieScreen(),
              },
            ),
          ),
        );
      },
    );
  }
}

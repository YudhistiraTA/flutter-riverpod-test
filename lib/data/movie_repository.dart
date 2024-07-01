import 'dart:convert';

import 'package:cache_test/domain/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final movieProvider =
    FutureProvider.family<MovieList, String>((ref, movieName) async {
  const apiKey = String.fromEnvironment('API_KEY');
  Map<String, String> header = {
    'accept': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };
  final response = await http.get(
    Uri.https("api.themoviedb.org", "/3/search/movie",
        {"query": movieName.isEmpty ? "spiderman" : movieName}),
    headers: header,
  );
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return MovieList.fromJson(json);
});

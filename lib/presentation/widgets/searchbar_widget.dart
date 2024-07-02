import 'package:cache_test/data/query_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

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
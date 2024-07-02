import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieSkeleton extends StatelessWidget {
  const MovieSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
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

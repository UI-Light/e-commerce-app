import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/features/home/presentation/widgets/category_loading_box.dart';

class CategoryLoadingListView extends StatelessWidget {
  const CategoryLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryLoadingBox(),
            CategoryLoadingBox(),
            CategoryLoadingBox(),
            CategoryLoadingBox(),
          ],
        ),
      ),
    );
  }
}

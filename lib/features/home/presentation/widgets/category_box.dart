import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/data/repositories/image_repository.dart';
import 'package:shopping_app/core/models/category_model.dart';
import 'package:shopping_app/core/presentation/palette.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          FutureBuilder<String?>(
            future: GetIt.I<ImageRepository>().getImage(category.name),
            builder: (context, snapshot) {
              return Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Palette.categoryBoxBg,
                    image: snapshot.hasData && snapshot.data != null
                        ? DecorationImage(
                            image: NetworkImage(snapshot.data!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/night.jpg'),
                            fit: BoxFit.cover,
                          )),
              );
            },
          ),
          const SizedBox(height: 8.0),
          Text(
            '${category.name[0].toUpperCase()}${category.name.substring(1)}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

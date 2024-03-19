import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopping_app/core/models/product_model.dart';
import 'package:shopping_app/core/presentation/widgets/products_box.dart';
import 'package:shopping_app/features/favourites/presentation/viewmodels/favourites_view_model.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  FavouritesViewModel favouritesViewModel = FavouritesViewModel();

  @override
  void initState() {
    //favouritesViewModel.getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: favouritesViewModel.favouriteProducts,
        builder: (context, favourites, _) {
          return GridView.builder(
            itemCount: favourites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ProductsBox(product: favourites[index]);
            },
          );
        });
  }
}

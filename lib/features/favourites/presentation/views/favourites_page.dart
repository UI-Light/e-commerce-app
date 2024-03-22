import 'package:flutter/material.dart';
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
    favouritesViewModel.getFavouriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
          child: Column(
            children: [
              const Text(
                'Liked Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ValueListenableBuilder(
                  valueListenable: favouritesViewModel.favouriteProducts,
                  builder: (context, favourites, _) {
                    return favourites.isEmpty
                        ? const Center(
                            child: Text('No Saved Item yet!'),
                          )
                        : Expanded(
                            child: GridView.builder(
                              itemCount: favourites.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return ProductsBox(product: favourites[index]);
                              },
                            ),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

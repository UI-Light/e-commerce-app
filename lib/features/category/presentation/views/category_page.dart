import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/core/utils/title_case.dart';
import 'package:shopping_app/features/category/presentation/view_model/category_view_model.dart';
import 'package:shopping_app/features/category/presentation/widgets/category_products.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _searchQuery = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    categoryViewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: ValueListenableBuilder(
              valueListenable: categoryViewModel.categoriesLoading,
              builder: (context, isLoadingCategories, _) {
                if (isLoadingCategories) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ValueListenableBuilder(
                    valueListenable: categoryViewModel.categoriesNotifier,
                    builder: (context, categories, _) {
                      return DefaultTabController(
                        length: categories.length,
                        child: Column(
                          children: [
                            const Text(
                              'All Categories',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 19,
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: const TextStyle(fontSize: 14),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _searchQuery.value = _controller.text;
                                    },
                                    icon: const Icon(Icons.search),
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TabBar(
                              isScrollable: true,
                              labelStyle: const TextStyle(fontSize: 13),
                              labelColor: Palette.blue,
                              unselectedLabelColor: Palette.tabUnselected,
                              tabs: [
                                for (final category in categories)
                                  Tab(text: category.nameInTitleCase),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      categoryViewModel.categoriesNotifier,
                                  builder: (context, categories, _) {
                                    return TabBarView(
                                      children: [
                                        for (final category in categories)
                                          CategoryProducts(
                                            category: category,
                                            searchQuery: _searchQuery,
                                          ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/features/category/presentation/widgets/electronics_tab.dart';
import 'package:shopping_app/features/category/presentation/widgets/jewellery_tab.dart';
import 'package:shopping_app/features/category/presentation/widgets/men_clothing_tab.dart';
import 'package:shopping_app/features/category/presentation/widgets/women_clothing.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Column(
            children: [
              const Text(
                'All Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TabBar(
                labelStyle: const TextStyle(fontSize: 13),
                labelColor: Palette.blue,
                unselectedLabelColor: Palette.tabUnselected,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'Electronics',
                  ),
                  Tab(
                    text: 'Jewellery',
                  ),
                  Tab(
                    text: 'Men Clothing',
                  ),
                  Tab(
                    text: 'Women Clothing',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    ElectronicsTab(),
                    JewelleryTab(),
                    MenClothingTab(),
                    WomenClothingTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

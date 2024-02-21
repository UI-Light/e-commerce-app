import 'package:flutter/material.dart';
import 'package:shopping_app/core/presentation/palette.dart';
import 'package:shopping_app/features/category/presentation/views/category_page.dart';
import 'package:shopping_app/features/favourites/presentation/views/favourites_page.dart';
import 'package:shopping_app/features/home/presentation/views/home_page.dart';
import 'package:shopping_app/features/profile/presentation/views/profile_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final PageController _pagesController = PageController();
  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pagesController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pagesController,
        children: const [
          HomePage(),
          CategoryPage(),
          FavouritesPage(),
          ProfilePage(),
          // ProductDetailsPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          //color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0
                      ? Palette.blue
                      : Palette.unselected, //027FAC or //007FAC
                ),
                onPressed: () {
                  onTapped(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.category,
                  color:
                      _selectedIndex == 1 ? Palette.blue : Palette.unselected,
                ),
                onPressed: () {
                  onTapped(1);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color:
                      _selectedIndex == 2 ? Palette.blue : Palette.unselected,
                ),
                onPressed: () {
                  onTapped(2);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color:
                      _selectedIndex == 3 ? Palette.blue : Palette.unselected,
                ),
                onPressed: () {
                  onTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/ui/views/category_page.dart';
import 'package:shopping_app/ui/views/home_page.dart';
import 'package:shopping_app/ui/views/profile_page.dart';
import 'package:shopping_app/ui/views/saved_page.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  final PageController _pagesController = PageController();
  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pagesController.jumpToPage(index);
    });
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
          SavedPage(),
          ProfilePage(),
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
                      ? const Color(0XFF007FAC)
                      : Colors.grey, //027FAC or //007FAC
                ),
                onPressed: () {
                  onTapped(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.category,
                  color: _selectedIndex == 1 ? Color(0XFF007FAC) : Colors.grey,
                ),
                onPressed: () {
                  onTapped(1);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _selectedIndex == 2 ? Color(0XFF007FAC) : Colors.grey,
                ),
                onPressed: () {
                  onTapped(2);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 3 ? Color(0XFF007FAC) : Colors.grey,
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

import 'package:flutter/material.dart';
import 'package:shopping_app/ui/views/home_page.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  final PageController _pagesController = PageController();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pagesController,
        children: const [
          HomePage(),
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
                  color: selected ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                  _pagesController.jumpToPage(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.category,
                  color: selected ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                  _pagesController.jumpToPage(1);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: selected ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                  _pagesController.jumpToPage(2);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: selected ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                  _pagesController.jumpToPage(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

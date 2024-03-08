import 'package:flutter/material.dart';

class CategoryLoadingBox extends StatelessWidget {
  const CategoryLoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: MediaQuery.of(context).size.height / 50,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black),
          ),
        ],
      ),
    );
  }
}

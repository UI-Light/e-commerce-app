import 'package:flutter/material.dart';

class DiscountGrid extends StatelessWidget {
  const DiscountGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.lightBlue),
      ),
    ); //C7E6F1
  }
}
//second gradient//FAD7DF  //BCE5F1
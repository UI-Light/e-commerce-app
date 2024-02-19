import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/palette.dart';

class Stars extends StatelessWidget {
  final double size;

  const Stars({super.key, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rate_rounded,
          size: size,
          color: Palette.star,
        ),
        Icon(
          Icons.star_rate_rounded,
          size: size,
          color: Palette.star,
        ),
        Icon(
          Icons.star_rate_rounded,
          size: size,
          color: Palette.star,
        ),
        Icon(
          Icons.star_rate_rounded,
          size: size,
          color: Palette.star,
        ),
        Icon(
          Icons.star_rate_rounded,
          size: size,
          color: Palette.star,
        ),
      ],
    );
  }
}

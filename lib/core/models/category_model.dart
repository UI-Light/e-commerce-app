class Category {
  final String image;
  final String category;

  Category({
    required this.category,
    required this.image,
  });

  static List<Category> categories = [
    Category(image: 'assets/lipstick.png', category: 'lipsticks'),
    Category(image: 'assets/makeup.png', category: 'makeup'),
    Category(image: 'assets/perfume.png', category: 'perfumes'),
    Category(image: 'assets/skincare.png', category: 'skincare'),
  ];
}

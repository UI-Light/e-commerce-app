class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> data) {
    return Rating(
      rate: data['rate'] as double,
      count: data['count'] as int,
    );
  }
}

import 'package:shopping_app/core/models/category_model.dart';

extension TitleCase on Category {
  String get nameInTitleCase {
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }
}

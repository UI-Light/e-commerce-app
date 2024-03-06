import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shopping_app/core/utils/logger.dart';

class ImageRepository {
  late final _logger = getLogger(ImageRepository);

  late final Dio _client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      baseUrl: const String.fromEnvironment('PEXELS_SEARCH_URL'),
      headers: {
        HttpHeaders.authorizationHeader:
            const String.fromEnvironment('PEXELS_API_KEY')
      },
    ),
  );

  /// Uses Pexels Image Search API
  /// https://www.pexels.com/api/documentation/#photos-search
  Future<String?> getImage(String name) async {
    try {
      final response = await _client.get('$name&per_page=1');
      if (response.statusCode == 200) {
        final body = Map<String, dynamic>.from(response.data);
        final photos = List.from(body['photos']);

        return photos.first['src']['small'];
      }
      _logger.log("Got response with code: ${response.statusCode}");
    } catch (e) {
      _logger.log(e);
    }
    return null;
  }
}

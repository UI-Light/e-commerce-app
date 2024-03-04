import 'package:get_it/get_it.dart';
import 'package:shopping_app/core/data/api_client.dart';
import 'package:shopping_app/features/home/data/home_repository.dart';

void registerDependencies({String baseUrl = ''}) {
  final apiClient = ApiClient(baseUrl: baseUrl);
  GetIt.I.registerLazySingleton<ApiClient>(() => apiClient);

  GetIt.I.registerLazySingleton<HomeRepository>(
    () => HomeRepository(client: apiClient),
  );
}

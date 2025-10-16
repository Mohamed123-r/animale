import 'package:animals/core/api/dio_consumer.dart';

class BreedApiService {
  final DioConsumer dioConsumer;

  BreedApiService({required this.dioConsumer});

  fetchBreeds({int limit = 10, int page = 1}) async {
    final response = await dioConsumer.get(
      '/v1/breeds?limit=$limit&page=$page',
    );
    return response;
  }

  Future<List<dynamic>> searchBreeds({required String query}) async {
    final response = await dioConsumer.get('/v1/breeds/search?q=$query');
    return response;
  }
}

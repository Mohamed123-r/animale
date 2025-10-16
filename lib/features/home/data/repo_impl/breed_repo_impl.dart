import 'package:animals/features/home/domain/entities/breed_entity.dart';

import '../../domain/repo/breed_repo.dart';
import '../api_sources/breed_api_sources.dart';
import '../mappers/breed_mapper.dart';
import '../models/breed_model.dart';

class BreedRepoImpl implements BreedRepo {
  final BreedApiService apiService;

  BreedRepoImpl({required this.apiService});

  @override
  Future<List<BreedEntity>> getBreeds({int limit = 10, int page = 1}) async {
    final response = await apiService.fetchBreeds(limit: limit, page: page);
    final models = (response as List).map((json) => BreedModel.fromJson(json)).toList();
    final entities = models.map((model) => model.toEntity()).toList();
    return entities;
  }
  @override
  Future<List<BreedEntity>> searchBreeds({required String query, }) async {
    final response = await apiService.searchBreeds(query: query, );
    final models = (response as List).map((json) => BreedModel.fromJson(json)).toList();
    final entities = models.map((model) => model.toEntity()).toList();
    return entities;
  }}
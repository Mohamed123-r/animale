import 'package:animals/features/home/domain/entities/breed_entity.dart';


abstract class BreedRepo {
  Future<List<BreedEntity>> getBreeds({int limit = 10, int page = 1});
  Future<List<BreedEntity>> searchBreeds({required String query, });
}
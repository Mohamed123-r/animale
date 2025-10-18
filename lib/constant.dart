import 'dart:convert';
import 'package:animals/features/home/data/mappers/breed_mapper.dart';
import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';
import 'features/home/data/models/breed_model.dart';
import 'features/home/domain/entities/breed_entity.dart';

String kIsLogin = 'isSuccessLogin';
String kToken = 'token';
String kFavorites = 'favorites';
var logger = Logger(printer: PrettyPrinter(), level: Level.debug);
List<BreedEntity> favoriteList = [];

Future<void> loadFavorites() async {
  String? jsonString = CacheHelper().getDataString(key: kFavorites);
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    final models = (jsonList).map((json) => BreedModel.fromJson(json)).toList();
    favoriteList = models.map((model) => model.toEntity()).toList();
  }
}

Future<void> saveFavorites() async {
  List<Map<String, dynamic>> jsonList = favoriteList.map((e) => e.toJson()).toList();
  String jsonString = jsonEncode(jsonList);
  await CacheHelper().saveData(key: kFavorites, value: jsonString);
}

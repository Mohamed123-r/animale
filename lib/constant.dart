import 'dart:convert';
import 'package:animals/features/home/data/mappers/breed_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';
import 'features/home/data/models/breed_model.dart';
import 'features/home/domain/entities/breed_entity.dart';

String kIsLogin = 'isSuccessLogin';
String kToken = 'token';
String kFavorites = 'favorites';
var logger = Logger(printer: PrettyPrinter(), level: Level.debug);

final ValueNotifier<List<BreedEntity>> favoriteNotifier =
    ValueNotifier<List<BreedEntity>>([]);

List<BreedEntity> get favoriteList => favoriteNotifier.value;

Future<void> loadFavorites() async {
  String? jsonString = CacheHelper().getDataString(key: kFavorites);
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    final models = (jsonList).map((json) => BreedModel.fromJson(json)).toList();
    favoriteNotifier.value = models.map((model) => model.toEntity()).toList();
  } else {
    favoriteNotifier.value = [];
  }
}

Future<void> saveFavorites() async {
  List<Map<String, dynamic>> jsonList = favoriteNotifier.value
      .map((e) => e.toJson())
      .toList();
  String jsonString = jsonEncode(jsonList);
  await CacheHelper().saveData(key: kFavorites, value: jsonString);
}

Future<void> toggleFavorite(BreedEntity pet) async {
  final list = List<BreedEntity>.from(favoriteNotifier.value);
  final existsIndex = list.indexWhere((e) => e.id == pet.id);
  if (existsIndex != -1) {
    list.removeAt(existsIndex);
  } else {
    list.add(pet);
  }
  favoriteNotifier.value = list;
  await saveFavorites();
}

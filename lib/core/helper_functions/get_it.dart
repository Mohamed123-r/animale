import 'package:animals/features/home/data/api_sources/breed_api_sources.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../../features/home/data/repo_impl/breed_repo_impl.dart';
import '../../features/home/domain/repo/breed_repo.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<BreedApiService>(
    () => BreedApiService(dioConsumer: getIt.get<DioConsumer>()),
  );
  getIt.registerLazySingleton<BreedRepo>(
    () => BreedRepoImpl(apiService: getIt.get<BreedApiService>()),
  );
}

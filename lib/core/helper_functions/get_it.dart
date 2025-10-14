import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  // getIt.registerLazySingleton<ApiSourcesLogin>(
  //   () => ApiSourcesLogin(dioConsumer: getIt.get<DioConsumer>()),
  // );

  // getIt.registerLazySingleton<LoginRepo>(
  //   () => LoginRepoImpl(apiSources: getIt.get<ApiSourcesLogin>()),
  // );
}

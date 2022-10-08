import 'package:get_it/get_it.dart';
import 'package:retroflux/data/datasources/local_datasource.dart';
import 'package:retroflux/data/repositories/homepage_repository_impl.dart';
import 'package:retroflux/data/repositories/log_view_repository_impl.dart';
import 'package:retroflux/domain/repositories/homepage_repository.dart';
import 'package:retroflux/domain/repositories/log_view_repository.dart';
import 'package:retroflux/domain/usecases/get_all_logs_usecase.dart';
import 'package:retroflux/domain/usecases/save_log_usecase.dart';
import 'package:retroflux/presentation/bloc/retroflux_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
      () => RetrofluxBloc(getAllLogsUsecase: sl(), saveLogUsecase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllLogsUsecase(repository: sl()));
  sl.registerLazySingleton(() => SaveLogUsecase(repository: sl()));

  //repositories
  sl.registerLazySingleton<HomepageRepository>(
      () => HomepageRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<LogViewRepository>(
      () => LogViewRepositoryImpl(localDataSource: sl()));

  //data
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferencesInstance: sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

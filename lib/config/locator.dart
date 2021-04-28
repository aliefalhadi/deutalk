import 'package:deutalk/provider/KamusProvider.dart';
import 'package:deutalk/provider/ModulProvider.dart';
import 'package:deutalk/services/ApiInterceptors.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/KamusService.dart';
import 'package:deutalk/services/ModulService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  init injected file
  locator.registerLazySingleton(() => ApiInterceptors());
  locator.registerLazySingleton(() => KamusService());
  locator.registerLazySingleton(() => ModulService());
  locator.registerLazySingleton(() => EventBusService());

  locator.registerFactory(() => KamusProvider());
  locator.registerFactory(() => ModulProvider());
}

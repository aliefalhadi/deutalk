import 'package:deutalk/provider/KamusProvider.dart';
import 'package:deutalk/provider/LoginProvider.dart';
import 'package:deutalk/provider/MainProvider.dart';
import 'package:deutalk/provider/ModulLatihanProvider.dart';
import 'package:deutalk/provider/ModulLatihanSoalProvider.dart';
import 'package:deutalk/provider/ModulProvider.dart';
import 'package:deutalk/services/ApiInterceptors.dart';
import 'package:deutalk/services/EventBusService.dart';
import 'package:deutalk/services/KamusService.dart';
import 'package:deutalk/services/LatihanService.dart';
import 'package:deutalk/services/ModulService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  init injected file
  locator.registerLazySingleton(() => ApiInterceptors());
  locator.registerLazySingleton(() => KamusService());
  locator.registerLazySingleton(() => ModulService());
  locator.registerLazySingleton(() => EventBusService());
  locator.registerLazySingleton(() => LatihanService());

  locator.registerFactory(() => KamusProvider());
  locator.registerFactory(() => ModulProvider());
  locator.registerFactory(() => ModulLatihanProvider());
  locator.registerFactory(() => MainProvider());
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => ModulLatihanSoalProvider());
}

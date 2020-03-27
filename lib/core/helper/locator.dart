import '../../view/home/stores/home_stores.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator() {

  /*
  * Use registerFactory if you need to instantiate it everytime its need
  * locator.registerFactory<LoginProvider>(() => LoginProvider());
  *
  * =================================================================
  *
  * Use registerSingleton if you dont need to instantiate it everytime
  * locator.registerSingleton(() => LoginProvider());
  * */

  locator.registerLazySingleton<HomeStores>(() => HomeStores());
}

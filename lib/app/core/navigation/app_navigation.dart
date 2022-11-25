import 'package:get/route_manager.dart';
import 'package:marvel_cine/app/feature/app_init/pages/init_page.dart';

import '../../feature/movies/presenter/pages/movies_page.dart';
import '../../feature/app_init/bindings/init_binding.dart';
import '../../feature/movies/bindings/movies_binding.dart';

class AppNavigation {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const MoviesPage(),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: '/initPage',
      page: () => const InitPage(),
      binding: InitControllerBinding(),
    ),
  ];
}

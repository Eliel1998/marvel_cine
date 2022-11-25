import 'package:get/route_manager.dart';
import 'package:marvel_cine/app/feature/app_init/pages/init_page.dart';

import '../../feature/movies/presenter/pages/movies_page.dart';
import 'bindings/controllers/init_controller_binding.dart';
import 'bindings/controllers/movies_controller_binding.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const MoviesPage(),
      binding: MoviesControllerBinding(),
    ),
    GetPage(
      name: '/initPage',
      page: () => const InitPage(),
      binding: InitControllerBinding(),
    ),
  ];
}


import 'package:get/get.dart';

import '../../movies/presenter/pages/movies_page.dart';

class InitController {
  Future<void> init() async {
     await Future.wait( [
      Future.delayed(const Duration(seconds: 2))
    ]);
    Get.toNamed(MoviesPage.routeName);
  }
}

import 'package:get/get.dart';
import 'package:marvel_cine/app/feature/app_init/controller/init_controller.dart';

class InitBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(()=>InitController());
  }
}
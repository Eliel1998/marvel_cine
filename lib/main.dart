
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:marvel_cine/app/feature/app_init/bindings/init_binding.dart';
import 'package:marvel_cine/app/feature/app_init/pages/init_page.dart';


import 'app/feature/movies/bindings/movies_binding.dart';
import 'app/core/navigation/app_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MoviesBinding().dependencies();
  InitControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: InitPage.routeName,
      getPages: AppNavigation.routes,
    );
  }
}

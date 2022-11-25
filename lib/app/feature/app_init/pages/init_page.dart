// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_cine/app/feature/app_init/controller/init_controller.dart';


class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);
  static const routeName = '/initPage';

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final controller = Get.find<InitController>();
  @override
  void initState() {
    super.initState();
    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Container(
          width: 220,
          height: 220,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_image.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    
    );
  }
}
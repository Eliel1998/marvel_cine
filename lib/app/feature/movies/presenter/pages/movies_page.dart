import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_cine/app/core/components/text_view_component.dart';

import '../../domain/entities/movie_entity.dart';

import '../controller/movies_controller.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);
  static const routeName = '/moviesPage';
  @override
  State<MoviesPage> createState() => _HomePageState();
}

class _HomePageState extends State<MoviesPage> {
  initAll() async {
    Future.delayed(const Duration(seconds: 2), () {
      controller.getMovies();
    });
  }

  final controller = Get.find<MoviesController>();

  @override
  void initState() {
    initAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: SizedBox(
          height: 50,
          child: Image.asset('assets/images/marvel.png',fit: BoxFit.fitHeight,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(() => Container(
            padding: const EdgeInsets.only(bottom: 15, left: 15, top: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    Image.asset('assets/images/decoration_avengers.png').image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextViewComponent(padding: 8, text: 'MARVEL'),
                TextViewComponent(padding: 8, text: 'CINEMATIC'),
                TextViewComponent(padding: 8, text: 'UNIVERSE'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextViewComponent(
                        padding: 8, text: 'LINHA DO TEMPO', fontSize: 15),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  height: 280,
                  child: controller.movieStore.movies.value.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.movieStore.movies.length,
                          itemBuilder: (context, index) {
                            final MovieEntity movie =
                                controller.movieStore.movies[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 200,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(movie.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.8),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  150, 177, 172, 172),
                                            ),
                                            child: Center(
                                                child: Text(
                                              '${index + 1}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            )),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  quebraLinha(movie.title),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '(${movie.year})',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          )),
    );
  }
}

String quebraLinha(String value) {
  return value.replaceFirst(RegExp(r':'), ':\n');
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_cine/app/components/movie_tile.dart';
import 'package:marvel_cine/app/feature/movies/presenter/pages/movie_details_page.dart';

import '../../../../components/text_view_component.dart';
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
            child: Image.asset(
              'assets/images/marvel.png',
              fit: BoxFit.fitHeight,
            )),
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
                const TextViewComponent(padding: 8, text: 'MARVEL'),
                const TextViewComponent(padding: 8, text: 'CINEMATIC'),
                const TextViewComponent(padding: 8, text: 'UNIVERSE'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:const [
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
                                MovieTile(index: index, movie: movie,onTap: () {
                                  Get.toNamed(MovieDetailsPage.routeName, arguments: movie);

                                },),
                                Text(
                                  controller.lineBeak(movie.title),
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

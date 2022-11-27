import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/movie_entity.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/movieDetailsPage';
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieEntity get movie => Get.arguments as MovieEntity;
  Size get screen => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // ignore: sort_child_properties_last
          Hero(tag: movie.id, child:Container(
            height: screen.height * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
               image: Image.network(movie.imageUrl).image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ) ,
          transitionOnUserGestures: true,
          ),
          Expanded(child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(movie.voteAverage.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Lançamento: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      movie.releaseDate,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(movie.overview,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),)
        ],
      ),
    );
  }
}

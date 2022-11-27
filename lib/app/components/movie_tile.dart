import 'package:flutter/material.dart';

import '../feature/movies/domain/entities/movie_entity.dart';

class MovieTile extends StatelessWidget {
  final MovieEntity movie;
  final int index;
  const MovieTile({required this.index, required this.movie, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Color.fromARGB(150, 177, 172, 172),
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
    );
  }
}

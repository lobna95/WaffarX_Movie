import 'package:flutter/material.dart';
import '../../model/movies_model.dart';

import 'movie_card.dart';

class MoviesList extends StatelessWidget {
  Result movie;
  MoviesList({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.count(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: List.generate(2, (index) {
              return MovieCardWidget(
                movie: movie,
              );
            })));
  }
}

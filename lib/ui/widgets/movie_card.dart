// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../Service/get_movies_service.dart';

// class MovieCardWidget extends StatelessWidget {
//   String imagePath;
//   String title;
//   GetMovieService get = GetMovieService();

//   MovieCardWidget({required this.imagePath, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Flexible(
//             fit: FlexFit.tight,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Stack(children: [
//                 Image.network(
//                   imagePath,
//                   // width: 100,
//                   // height: 250,
//                 ),
//                 Positioned(top: 150, left: 90, child: Text("New"))
//               ]),
//             )),
//         FlatButton(
//             onPressed: () {
//               get.getMovies();
//             },
//             child: Text(title)),
//       ],
//     );
//   }
// }

// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/movie_bloc.dart';
import '../../model/movies_model.dart';
import '../../model/movie_details_screen_arguments.dart';
import '../screens/movie_details_screen.dart';

class MovieCardWidget extends StatelessWidget {
  Result movie;
  MovieCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MovieBloc>();
    return GestureDetector(
      onTap: () async {
        // var platform = const MethodChannel('com.nativeActivity/iosChannel');
        // final String result = await platform.invokeMethod('StartNativeIOS');
        // cubit.
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,
            arguments: MovieDetailsScreenArgument(movieID: "${movie.id}"));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                  // width: 100,
                  // height: 250,
                ),
                // Positioned(top: 150, left: 90, child: Text("New"))
              )),
          Text(movie.title),
        ],
      ),
    );
  }
}

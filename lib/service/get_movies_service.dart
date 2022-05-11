import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import '../model/movies_model.dart';

class GetMovieService {
  final String moviesURL =
      "https://api.themoviedb.org/3/discover/movie?api_key=fffc11bad42e01fa3032fb760b319219&language=en_US";

  Future<List<Result>> getMovies() async {
    try {
      Response res = await get(Uri.parse(moviesURL));

      if (res.statusCode >= 200 && res.statusCode <= 400) {
        dynamic body = jsonDecode(res.body);

        MoviesModel movies = MoviesModel.fromJson(body);
        return movies.results;
      } else {
        throw "Unable to retrieve movies.";
      }
    } on SocketException catch (e) {
      rethrow;
    } on HttpException catch (e) {
      rethrow;
    } on FormatException catch (e) {
      rethrow;
    }
  }
}

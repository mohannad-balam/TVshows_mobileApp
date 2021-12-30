import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/Model/top_rated.dart';
import 'package:movie_application/Model/trending.dart';
import 'package:movie_application/Model/tv_popular.dart';
import 'package:movie_application/Utils/utils.dart';

class MoviesController extends GetxController {
  //this function is gonna fetch data from API and retrun it as an object of dart after decoding it from string to json
  //and the turn it to dart object by using fromJosn() method
  Future<TrendingResults> getTrending(
      String mediaType, String timeWindow) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/trending/$mediaType/$timeWindow?api_key=${APIs.apiKey}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //ok
      //returning dart object form json url

      //or jsonDecode()
      return TrendingResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
  //end function

  Future<TopRated> getTopRated() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=${APIs.apiKey}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return TopRated.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  Future<TvPopular> getTvPopular() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/tv/popular?api_key=${APIs.apiKey}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return TvPopular.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}

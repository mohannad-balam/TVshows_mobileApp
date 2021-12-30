import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/Controller/movies_controller.dart';
import 'package:movie_application/Model/top_rated.dart';
import 'package:movie_application/Model/trending.dart';
import 'package:movie_application/Model/tv_popular.dart';
import 'package:movie_application/Utils/utils.dart';
import 'package:movie_application/View/movies/top_rateds.dart';

import 'movies/trendingWidget.dart';
import 'movies/tv_populars.dart';

class HomePage extends GetWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesController moviesController = Get.put(MoviesController());
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: ColorsUtil.transparent,
        middle: Text(
          'M B TV\'s',
          style: GoogleFonts.amaticSc(
            color: ColorsUtil.black,
            fontSize: 36,
          ),
        ),
      ),
      child: ListView(
        children: [
          FutureBuilder<TrendingResults>(
            future: moviesController.getTrending('all', 'week'),
            builder: (BuildContext context,
                AsyncSnapshot<TrendingResults> snapshot) {
              if (snapshot.hasData) {
                return TrendingShows(
                  trendings: snapshot.data.results,
                );
              } else {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return Center(
                  child: Text(snapshot.error),
                );
              }
            },
          ),
          FutureBuilder<TopRated>(
            future: moviesController.getTopRated(),
            builder: (BuildContext context,
                AsyncSnapshot<TopRated> topRatedSnapshot) {
              if (topRatedSnapshot.hasData) {
                return TopRatedShows(
                  topRateds: topRatedSnapshot.data.results,
                );
              } else {
                if (topRatedSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return Center(
                  child: Text(topRatedSnapshot.error),
                );
              }
            },
          ),
          FutureBuilder<TvPopular>(
            future: moviesController.getTvPopular(),
            builder: (BuildContext context, AsyncSnapshot<TvPopular> snapshot) {
              if (snapshot.hasData) {
                return PopularTvShows(
                  tvPopulars: snapshot.data.results,
                );
              } else {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return Center(
                  child: Text(snapshot.error),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

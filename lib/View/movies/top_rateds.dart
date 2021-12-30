import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/Model/top_rated.dart';
import 'package:movie_application/Utils/utils.dart';
import 'package:movie_application/View/description/show_details.dart';

class TopRatedShows extends StatelessWidget {
  final List<TopResults> topRateds;

  const TopRatedShows({Key key, this.topRateds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Shows',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRateds.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ShowDetails(
                          id: topRateds[index].id,
                          title: topRateds[index].title,
                          name: topRateds[index].originalTitle,
                          desctiption: topRateds[index].overview,
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRateds[index].backdropPath,
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRateds[index].posterPath,
                          vote: topRateds[index].voteAverage.toString(),
                          launchOn: topRateds[index]
                                  .releaseDate
                                  .toString()
                                  .split(" ")[0] ??
                              'N/A',
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Hero(
                          tag: topRateds[index].id.toString(),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topRateds[index].posterPath),
                                )),
                          ),
                        ),
                        ModifiedText(
                          text: topRateds[index].title ?? 'Loading ...',
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

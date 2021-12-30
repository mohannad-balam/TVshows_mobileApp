import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/Model/trending.dart';
import 'package:movie_application/Utils/utils.dart';
import 'package:movie_application/View/description/show_details.dart';

class TrendingShows extends StatelessWidget {
  final List<Result> trendings;

  const TrendingShows({Key key, this.trendings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Of The Week',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendings.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ShowDetails(
                          id: trendings[index].id,
                          title: trendings[index].title,
                          name: trendings[index].name,
                          desctiption: trendings[index].overview,
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              trendings[index].backdropPath,
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              trendings[index].posterPath,
                          vote: trendings[index].voteAverage.toString(),
                          launchOn: trendings[index]
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
                          tag: trendings[index].id.toString(),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trendings[index].posterPath),
                                )),
                          ),
                        ),
                        ModifiedText(
                          text: trendings[index].title ?? trendings[index].name,
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

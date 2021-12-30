import 'package:flutter/cupertino.dart';
import 'package:movie_application/Model/tv_popular.dart';
import 'package:movie_application/Utils/utils.dart';
import 'package:movie_application/View/description/show_details.dart';

class PopularTvShows extends StatelessWidget {
  final List<Result> tvPopulars;

  const PopularTvShows({Key key, this.tvPopulars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvPopulars.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ShowDetails(
                          id: tvPopulars[index].id,
                          title: tvPopulars[index].name,
                          name: tvPopulars[index].originalName,
                          desctiption: tvPopulars[index].overview,
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              tvPopulars[index].backdropPath,
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              tvPopulars[index].posterPath,
                          vote: tvPopulars[index].voteAverage.toString(),
                          launchOn: tvPopulars[index]
                                  .firstAirDate
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
                          tag: tvPopulars[index].id.toString(),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvPopulars[index].posterPath),
                                )),
                          ),
                        ),
                        ModifiedText(
                          text: tvPopulars[index].name ?? 'Loading ...',
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

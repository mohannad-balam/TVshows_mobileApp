import 'package:flutter/cupertino.dart';
import 'package:movie_application/Utils/utils.dart';

class ShowDetails extends StatelessWidget {
  final int id;
  final String name;
  final String title;
  final String desctiption;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String launchOn;

  const ShowDetails(
      {Key key,
      this.id,
      this.title,
      this.name,
      this.desctiption,
      this.bannerUrl,
      this.posterUrl,
      this.vote,
      this.launchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: ModifiedText(
          text: title ?? name ?? 'Loading',
          size: 14,
        ),
      ),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Hero(
                    tag: id.toString(),
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: ColorsUtil.slightlyBlack,
                    child: ModifiedText(
                      text: ' ⭐ Average Rating - ' + vote + '/10',
                      color: ColorsUtil.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
              text: name ?? title ?? 'Loading ...',
              size: 22,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: ModifiedText(
              text: "Released on - " + launchOn ?? "N/A",
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(posterUrl),
                    ),
                    borderRadius: BorderRadius.circular(25)),
                margin: const EdgeInsets.all(7),
                height: 200,
                width: 120,
                //
              ),
              Flexible(
                child: ModifiedText(
                  text: desctiption ?? 'Loading ...',
                  size: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

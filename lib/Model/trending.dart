// To parse this JSON data, do
//
//     final trendingResults = trendingResultsFromJson(jsonString);

import 'dart:convert';

TrendingResults trendingResultsFromJson(String str) =>
    TrendingResults.fromJson(json.decode(str));

String trendingResultsToJson(TrendingResults data) =>
    json.encode(data.toJson());

class TrendingResults {
  TrendingResults({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory TrendingResults.fromJson(Map<String, dynamic> json) =>
      TrendingResults(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.id,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.releaseDate,
    this.video,
    this.title,
    this.adult,
    this.backdropPath,
    this.popularity,
    this.mediaType,
    this.name,
    this.originalName,
    this.originCountry,
    this.firstAirDate,
  });

  List<int> genreIds;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String posterPath;
  int id;
  double voteAverage;
  int voteCount;
  String overview;
  DateTime releaseDate;
  bool video;
  String title;
  bool adult;
  String backdropPath;
  double popularity;
  MediaType mediaType;
  String name;
  String originalName;
  List<String> originCountry;
  DateTime firstAirDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        posterPath: json["poster_path"],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        overview: json["overview"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"] == null ? null : json["video"],
        title: json["title"] == null ? null : json["title"],
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
        name: json["name"] == null ? null : json["name"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
      );

  Map<String, dynamic> toJson() => {
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "poster_path": posterPath,
        "id": id,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "overview": overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video == null ? null : video,
        "title": title == null ? null : title,
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
        "name": name == null ? null : name,
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, ES, KO, JA }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

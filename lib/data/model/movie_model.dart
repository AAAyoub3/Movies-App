class Movie {
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

// Factory for JSON (from API)
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

// Factory for Firestore (camelCase keys)
  factory Movie.fromFireStore(Map<String, dynamic> data) {
    return Movie(
      adult: data['adult'],
      backdropPath: data['backdropPath'],
      genreIds: data['genreIds'] != null ? data['genreIds'].cast<num>() : [],
      id: data['id'],
      originalLanguage: data['originalLanguage'],
      originalTitle: data['originalTitle'],
      overview: data['overview'],
      popularity: data['popularity'],
      posterPath: data['posterPath'],
      releaseDate: data['releaseDate'],
      title: data['title'],
      video: data['video'],
      voteAverage: data['voteAverage'],
      voteCount: data['voteCount'],
    );
  }

// To Firestore map (camelCase)
  Map<String, dynamic> toFireStore() {
    return {
      "adult": adult,
      "backdropPath": backdropPath,
      "genreIds": genreIds,
      "id": id,
      "originalLanguage": originalLanguage,
      "originalTitle": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "posterPath": posterPath,
      "releaseDate": releaseDate,
      "title": title,
      "video": video,
      "voteAverage": voteAverage,
      "voteCount": voteCount,
    };
  }

// Optional: To JSON (snake_case)
  Map<String, dynamic> toJson() {
    return {
      "adult": adult,
      "backdrop_path": backdropPath,
      "genre_ids": genreIds,
      "id": id,
      "original_language": originalLanguage,
      "original_title": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "release_date": releaseDate,
      "title": title,
      "video": video,
      "vote_average": voteAverage,
      "vote_count": voteCount,
    };
  }
}

// class Movie{
//   bool? adult;
//   String? backdropPath;
//   List<num>? genreIds;
//   num? id;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   num? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   num? voteAverage;
//   num? voteCount;
//
//   Movie({
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.id,
//     this.originalLanguage,
//     this.originalTitle,
//     this.overview,
//     this.popularity,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.voteCount,
//   });
//
//   Movie.fromFireStore(Map<String,dynamic> data):this(
//       adult: data['adult'],
//       backdropPath : data['backdropPath'],
//       genreIds : data['genreIds'] != null ? data['genreIds'].cast<num>() : [],
//       id : data['id'],
//       originalLanguage : data['originalLanguage'],
//       originalTitle : data['originalTitle'],
//       overview : data['overview'],
//       popularity : data['popularity'],
//       posterPath : data['posterPath'],
//       releaseDate : data['releaseDate'],
//       title : data['title'],
//       video : data['video'],
//       voteAverage : data['voteAverage'],
//       voteCount : data['voteCount'],
//   );
//
//   Map<String,dynamic> toFireStore(){
//     return{
//       "adult": adult,
//       "backdropPath" : backdropPath,
//       "genreIds" : genreIds,
//       "id" : id,
//       "originalLanguage" : originalLanguage,
//       "originalTitle" : originalTitle,
//       "overview" : overview,
//       "popularity" : popularity,
//       "posterPath" : posterPath,
//       "releaseDate" : releaseDate,
//       "title" : title,
//       "video" : video,
//       "voteAverage" : voteAverage,
//       "voteCount" : voteCount,
//     };
//   }
// }

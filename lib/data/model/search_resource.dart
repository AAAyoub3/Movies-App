import 'package:movies/data/model/movie_model.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":"/yd74Cl9P8aQLnzIshFYdjSH6JVk.jpg","genre_ids":[28,878,53],"id":7916,"original_language":"en","original_title":"Far Cry","overview":"Jack Carver, a former member of the Special Forces takes the journalist Valerie Cardinal to an Island to visit her uncle Max who is working in a Military complex on the Island. As they arrive Valerie gets captured by the minions of Doctor Krüger. After the destruction of his boat Jack finds out about the true purpose of the Facilities on the Island, which is the creation of genetic soldiers.","popularity":8.264,"poster_path":"/neo9UJbh6mMxpxPggY905BDAZzT.jpg","release_date":"2008-10-02","title":"Far Cry","video":false,"vote_average":3.68,"vote_count":269},{"adult":false,"backdrop_path":"/w2U56Os9yvFGnQsrJGPTIXRBtnK.jpg","genre_ids":[18,9648],"id":509934,"original_language":"en","original_title":"Far Cry 5: Inside Eden's Gate","overview":"Rumors of a fanatical cult called The Project at Eden's Gate lure three vloggers to remote Hope County, Montana. Following leads of missing locals and other strange events, the three infiltrate the cult. Shocked by what they uncover, they risk everything to warn the world.","popularity":3.402,"poster_path":"/8dTKE0hH68sCWG8IvoV4Ds82h1g.jpg","release_date":"2018-03-05","title":"Far Cry 5: Inside Eden's Gate","video":false,"vote_average":7.1,"vote_count":23},{"adult":false,"backdrop_path":null,"genre_ids":[12,27,35],"id":413659,"original_language":"en","original_title":"The Far Cry Experience","overview":"Actor Christopher Mintz-Plasse goes to Rook Island for the Far Cry Experience, where he meets Vaas and his pirate gang.","popularity":1.4,"poster_path":"/Afd5RDbnaWP3Rd4Xt8F1O2frEgy.jpg","release_date":"2012-11-01","title":"The Far Cry Experience","video":false,"vote_average":7.8,"vote_count":8},{"adult":false,"backdrop_path":null,"genre_ids":[99],"id":941382,"original_language":"en","original_title":"Aesthetics of Far Cry 2","overview":"A detailed deep dive into the fabric of Far Cry 2","popularity":0.6,"poster_path":null,"release_date":"2019-03-17","title":"Aesthetics of Far Cry 2","video":false,"vote_average":0.0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[27],"id":18754,"original_language":"zh","original_title":"孤岛惊魂","overview":"In the 1970s on the Binlusai islands, a young mother is killed when she was running with her son run from an evil presence in an abandoned Roman Catholic leper colony. In the present day, a group of four young men and women are travelling to the island to take part in a survival game run by TV channel Search Planet headed by Chen Jiadong (Philip Keung). Also on the boat is the television presenter Stanley (Jessica Xu) and cameraman Ken (Shaun Tam). The eight people have been split into four pairs where they are given a map which leads to a flag; their aim is to survive without any supplies, and the winning duo gets a grand prize of one-million dollars. As they approach the island, their ship is attacked by something unknown under the water and most of their luggage is lost. Shen Yilin (Mini Yang) has preserved her map which she gives to her partner Peng Fei (Jordan Chan).","popularity":2.803,"poster_path":"/hBPUbk9VwuJNfe1NeR02CTtNSEm.jpg","release_date":"2011-07-07","title":"Mysterious Island","video":false,"vote_average":3.533,"vote_count":15},{"adult":false,"backdrop_path":"/36dFOvSJXJEALPug3YQkCTx25gg.jpg","genre_ids":[18],"id":74403,"original_language":"fr","original_title":"L'Arbre de Noël","overview":"A French-American millionaire, his girlfriend and his war buddy try to grant his dying son's every wish.","popularity":5.877,"poster_path":"/usEaKgFPfVQHLKltzPshcPlIP4C.jpg","release_date":"1969-09-25","title":"The Christmas Tree","video":false,"vote_average":6.426,"vote_count":27}]
/// total_pages : 1
/// total_results : 6

class SearchResource {
  SearchResource({
      this.page, 
      this.results,
      this.statusMessage,
      this.statusCode,
      this.totalPages, 
      this.totalResults,});

  SearchResource.fromJson(dynamic json) {
    page = json['page'];
    statusMessage = json['status_message'];
    statusCode = json['status_code'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Movie>? results;
  String? statusMessage;
  int? statusCode;
  num? totalPages;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : "/yd74Cl9P8aQLnzIshFYdjSH6JVk.jpg"
/// genre_ids : [28,878,53]
/// id : 7916
/// original_language : "en"
/// original_title : "Far Cry"
/// overview : "Jack Carver, a former member of the Special Forces takes the journalist Valerie Cardinal to an Island to visit her uncle Max who is working in a Military complex on the Island. As they arrive Valerie gets captured by the minions of Doctor Krüger. After the destruction of his boat Jack finds out about the true purpose of the Facilities on the Island, which is the creation of genetic soldiers."
/// popularity : 8.264
/// poster_path : "/neo9UJbh6mMxpxPggY905BDAZzT.jpg"
/// release_date : "2008-10-02"
/// title : "Far Cry"
/// video : false
/// vote_average : 3.68
/// vote_count : 269


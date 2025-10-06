import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:provider/provider.dart';
import 'package:movies/data/model/movie_model.dart';
import '../../data/firebase_utils.dart';
import '../../utils/myTheme.dart';
import '../../utils/provider.dart';

class PosterWithBookmark extends StatefulWidget {
  late bool state;
  var object;
  PosterWithBookmark({super.key,
    this.state = false,
    required this.object});

  @override
  State<PosterWithBookmark> createState() => _PosterWithBookmarkState();
}

class _PosterWithBookmarkState extends State<PosterWithBookmark> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var listProvider= Provider.of<ProviderList>(context);
    listProvider.getAllMoviesFromFireStore();

    for(int i = 0 ;i<listProvider.moviesList.length;i++){
      if(listProvider.moviesList[i].id == widget.object.id)
        {
          setState(() {
            widget.state = true;
          });
        }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key:formKey,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            /// image
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailsScreen.routeName,
                  arguments: MovieArgs(
                    object: widget.object
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Stack(
                  children: [
                    /// image
                    CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500${widget.object.posterPath}",
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    ),
                  ],
                ),
              ),
            ),

            /// bookmark
            InkWell(
                onTap: () {
                  // setState((){
                    if(widget.state==false){
                      addMovie();
                      widget.state = true;
                      setState(() {

                      });
                    }
                    else {
                      removeMovie();
                      widget.state = false;
                      setState(() {

                      });
                    }
                    // });
                  print(widget.state);
                },
                child: widget.state == false
                    ? Stack(alignment: Alignment.center, children: [
                        /// bookmark
                        Icon(
                          Icons.bookmark,
                          color: MyThemeData.greyColor.withValues(alpha: 0.8),
                          size: 50,
                        ),

                        /// add
                        Icon(Icons.add, color: MyThemeData.whiteColor),
                      ])
                    : Stack(alignment: Alignment.center, children: [
                        /// bookmark
                        Icon(
                          Icons.bookmark,
                          color: MyThemeData.yellowColor.withOpacity(0.8),
                          size: 50,
                        ),

                        /// check
                        Icon(Icons.check, color: MyThemeData.whiteColor),
                      ])),
          ],
        ),
      ),
    );
  }
  void addMovie(){ /// working
    if(formKey.currentState!.validate()){
      FirebaseUtils.addMovieToFireStore(Movie(
        title: widget.object.title,
        posterPath: widget.object.posterPath,
        releaseDate: widget.object.releaseDate,
        voteCount: widget.object.voteCount,
        id: widget.object.id,
        backdropPath: widget.object.backdropPath,
        adult: widget.object.adult,
        genreIds: widget.object.genreIds,
        originalLanguage: widget.object.originalLanguage,
        originalTitle: widget.object.originalTitle,
        overview:widget.object. overview,
        popularity: widget.object.popularity,
        video: widget.object.video,
        voteAverage: widget.object.voteAverage,
      ));
    }
    else{
      setState(() {
        print('Error');
      });
    }
  }

  void removeMovie(){
    try{
      FirebaseUtils.deleteMovieFromFireStore(widget.object.id.toString());
    }catch(e){
      print(e);
    }
  }
}

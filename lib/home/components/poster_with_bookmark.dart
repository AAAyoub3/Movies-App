import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/movie_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:movies/data/model/movie_model.dart';
import '../../data/firebase_utils.dart';
import '../../utils/my_theme.dart';
import '../../utils/provider.dart';
import '../full_media_screen.dart';

class PosterWithBookmark extends StatefulWidget {
  final Movie object;
  final bool inMovieDetailScreen;

  const PosterWithBookmark({super.key, required this.object, this.inMovieDetailScreen = false});

  @override
  State<PosterWithBookmark> createState() => _PosterWithBookmarkState();
}

class _PosterWithBookmarkState extends State<PosterWithBookmark> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Only load once when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderList>().getAllMoviesFromFireStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    var listProvider = context.watch<ProviderList>();
    final isBookmarked =
        listProvider.moviesList.any((movie) => movie.id == widget.object.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            /// image
            InkWell(
              onTap: () {
                if(widget.inMovieDetailScreen) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullMediaScreen(
                          mediaUrl: "https://image.tmdb.org/t/p/w500${widget.object.posterPath}"),
                    ),
                  );
                  return;
                }
                Navigator.pushNamed(
                  context,
                  MovieDetailsScreen.routeName,
                  arguments: MovieArgs(object: widget.object),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Stack(
                  children: [
                    /// image
                    CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${widget.object.posterPath}",
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ],
                ),
              ),
            ),

            /// bookmark
            InkWell(
              onTap: () async {
                final provider = context.read<ProviderList>();
                // setState((){
                if (isBookmarked) {
                  await removeMovie();
                } else {
                  await addMovie();
                }
                // });
                // Refresh provider data
                await provider.getAllMoviesFromFireStore();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.bookmark,
                    color: (isBookmarked
                            ? MyThemeData.yellowColor
                            : MyThemeData.greyColor)
                        .withValues(alpha: 0.8),
                    size: 50,
                  ),
                  Icon(
                    isBookmarked ? Icons.check : Icons.add,
                    color: MyThemeData.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addMovie() async {
    if (formKey.currentState?.validate() ?? false) {
      await FirebaseUtils.addMovieToFireStore(widget.object);
    } else {
      setState(() {
        debugPrint('Form validation failed');
      });
    }
  }

  Future<void> removeMovie() async {
    try {
      await FirebaseUtils.deleteMovieFromFireStore(widget.object.id.toString());
    } catch (e) {
      debugPrint('Error deleting: $e');
    }
  }
}

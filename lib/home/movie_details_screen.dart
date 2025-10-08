import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/movie_model.dart';
import 'package:movies/home/components/category_widget.dart';
import 'package:movies/home/components/poster_with_bookmark.dart';
import 'package:movies/data/API/api_manager.dart';
import 'package:movies/data/model/similar_resource.dart';
import '../utils/my_theme.dart';
import 'components/horizontal_slider.dart';
import 'full_media_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'movieDetailsScreen';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as MovieArgs;

    return FutureBuilder<SimilarResource>(
        future: ApiManager.getSimilar(args.object.id),
        builder: (context, snapshot) {
          /// If it is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }

          var similarResponse = snapshot.data!;

          var categoryList = similarResponse.results;

          /// User Error
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(similarResponse.statusMessage ?? ''),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Try Again please"))
              ],
            );
          }

          /// API Error
          if (similarResponse.results == null) {
            return Column(
              children: [
                Text(similarResponse.statusMessage ?? ''),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Try Again sir"))
              ],
            );
          }

          return Scaffold(
            backgroundColor: MyThemeData.blackColor,
            appBar: AppBar(
              title: Text(args.object.title ?? ''),
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// video
                    Column(
                      children: [
                        Stack(alignment: Alignment.center, children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FullMediaScreen(
                                      mediaUrl: "https://image.tmdb.org/t/p/w500${args.object.backdropPath}"),
                                ),
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: args.object.backdropPath == null
                                  ? ''
                                  : "https://image.tmdb.org/t/p/w500${args.object.backdropPath}",
                              fit: BoxFit.fitHeight,
                              height: MediaQuery.of(context).size.height * 0.25,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          args.object.video == true
                              ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_circle),
                            color: MyThemeData.whiteColor,
                            iconSize: 100,
                          )
                              : const SizedBox.shrink(),
                        ]),
                      ],
                    ),

                    /// Title and data
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
                      child: Text(
                        args.object.title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, bottom: 6, top: 6),
                      child: Text(
                        args.object.releaseDate ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),

                    /// image & category & description
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// img and bookmark
                        PosterWithBookmark(object: args.object, inMovieDetailScreen: true,),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /// categories
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      CategoryWidget(
                                          category:
                                              args.object.genreIds?[index] ?? 0),
                                  itemCount: args.object.genreIds?.length ?? 0,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2.3,
                                  ),
                                ),
                              ),

                              /// description
                              Text(
                                args.object.overview ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              /// star rate
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: MyThemeData.yellowColor,
                                  ),
                                  Text('${args.object.voteAverage}')
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    /// More like this
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: HorizontalSlider(
                            title: "More Like This", list: categoryList)),

                    const SizedBox(height: 15)
                  ]),
            ),
          );
        });
  }
}

class MovieArgs {
  final Movie object;
  MovieArgs({required this.object});
}

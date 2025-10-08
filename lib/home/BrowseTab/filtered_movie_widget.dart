import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/movie_model.dart';
import 'package:movies/home/movie_details_screen.dart';
import 'package:movies/utils/my_theme.dart';

class FilterMovieWidget extends StatelessWidget {
  final Movie object;
  const FilterMovieWidget({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,
            arguments: MovieArgs(object: object));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${object.posterPath}",
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height * 0.3,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Text(object.title ?? '',
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyThemeData.whiteColor)))
          ],
        ),
      ),
    );
  }
}

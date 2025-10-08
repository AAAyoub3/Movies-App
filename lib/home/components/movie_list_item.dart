import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/components/poster_with_bookmark.dart';

import '../../data/model/movie_model.dart';

class MovieListItem extends StatelessWidget {
  final Movie object;
  // final bool state;
  const MovieListItem({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PosterWithBookmark(
            object: object,
          ),

          // SizedBox(width: 12,),

          /// side texts
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${object.title}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                    maxLines: 3),
                Text("Release date: ${object.releaseDate}",
                    style: Theme.of(context).textTheme.bodyMedium, maxLines: 3),
                Text("Rating: ${object.voteAverage}",
                    style: Theme.of(context).textTheme.bodyMedium, maxLines: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

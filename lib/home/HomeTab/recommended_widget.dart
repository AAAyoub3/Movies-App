import 'package:flutter/material.dart';
import 'package:movies/home/components/poster_with_bookmark.dart';

import '../../data/model/movie_model.dart';
import '../../utils/my_theme.dart';

class RecommendedWidget extends StatefulWidget {
  final Movie object;
  const RecommendedWidget({super.key, required this.object});

  @override
  State<RecommendedWidget> createState() =>
      _RecommendedWidgetState();
}

class _RecommendedWidgetState
    extends State<RecommendedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterWithBookmark(object: widget.object),

          /// data
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyThemeData.yellowColor,
              ),
              Text(
                ' ${widget.object.voteAverage}',
              ),
            ],
          ),
          Text(
            widget.object.title!,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(widget.object.releaseDate!,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyThemeData.lightGreyColor))
        ],
      ),
    );
  }
}

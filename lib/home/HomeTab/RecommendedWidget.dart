import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/PosterWithBookmarkWidget.dart';

import '../../utils/myTheme.dart';

class RecommendedPosterWithBookmark extends StatefulWidget {
  var object;
  RecommendedPosterWithBookmark({required this.object});

  @override
  State<RecommendedPosterWithBookmark> createState() => _RecommendedPosterWithBookmarkState();
}

class _RecommendedPosterWithBookmarkState extends State<RecommendedPosterWithBookmark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width*0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterWithBookmark(
            object: widget.object),
          /// data
          Row(
            children: [
              Icon(Icons.star, color: MyThemeData.yellowColor,),
              Text(' ${widget.object.voteAverage}',),
            ],
          ),
          Text(widget.object.title!,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(widget.object.releaseDate!,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyThemeData.lightGreyColor))
        ],
      ),
    );
  }
}

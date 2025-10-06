import 'package:flutter/material.dart';
import 'package:movies/home/HomeTab/RecommendedWidget.dart';
import '../../utils/myTheme.dart';
import 'PosterWithBookmarkWidget.dart';

class HorizontalSliderWidget extends StatelessWidget{
  String title;
  var list;
  bool recommended;
  HorizontalSliderWidget({required this.title, required this.list, this.recommended = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyThemeData.containerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 0, 5),
            child: Text(title,
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)
            ),
          ),

          /// horizontal scroll - list
          recommended?
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) =>
                  RecommendedPosterWithBookmark(
                    object: list![index],
                  ),
              itemCount: list!.length,
            ),
          ):

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) =>
                  PosterWithBookmark(
                    object: list![index],
                  ),
              itemCount: list!.length,
            ),
          ),
        ],
      ),
    );
  }
}
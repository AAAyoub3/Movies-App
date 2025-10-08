import 'package:flutter/material.dart';
import 'package:movies/data/model/movie_model.dart';
import 'package:movies/home/HomeTab/recommended_widget.dart';
import '../../utils/my_theme.dart';
import 'poster_with_bookmark.dart';

class HorizontalSlider extends StatelessWidget{
  final String title;
  final List<Movie>? list;
  final bool recommended;
  const HorizontalSlider({super.key, required this.title, required this.list, this.recommended = false});

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
                  RecommendedWidget(
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
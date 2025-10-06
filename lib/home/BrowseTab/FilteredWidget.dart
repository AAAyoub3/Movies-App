import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:movies/utils/myTheme.dart';

class FilterMovieWidget extends StatelessWidget {
  var object;
  FilterMovieWidget({required this.object});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: MovieArgs(object: object));},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${object.posterPath}",
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height*0.3,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(width: 10),
            Expanded(child: Text(object.title,maxLines: 3,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyThemeData.whiteColor)))
          ],
        ),
      ),
    );
  }
}

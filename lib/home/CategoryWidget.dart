import 'package:flutter/material.dart';

import '../utils/myTheme.dart';

class CategoryWidget extends StatelessWidget {
  Map<num,String> genre={
    28    : "Action",
    12    : "Adventure",
    16    : "Animation",
    35    : "Comedy" ,
    80    : "Crime" ,
    99    : "Documentary" ,
    18    : "Drama" ,
    10751 : "Family" ,
    14    : "Fantasy" ,
    36    : "History" ,
    27    : "Horror" ,
    10402 : "Music" ,
    9648  : "Mystery" ,
    10749 : "Romance" ,
    878   : "Science Fiction" ,
    10770 : "TV Movie" ,
    53    : "Thriller" ,
    10752 : "War" ,
    37    : "Western"
  };
  num category;
  CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 3, left: 6, right: 6),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: MyThemeData.lightGreyColor)
        ),
        child: Text(genre[category]!,style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,)
    );
  }
}

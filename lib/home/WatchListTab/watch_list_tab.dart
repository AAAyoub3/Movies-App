import 'package:flutter/material.dart';
import 'package:movies/home/components/movie_list_item.dart';
import 'package:movies/utils/my_theme.dart';
import 'package:provider/provider.dart';

import '../../utils/provider.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});


  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  @override
  Widget build(BuildContext context) {

    var listProvider= Provider.of<ProviderList>(context);
    // listProvider.getAllMoviesFromFireStore();
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          /// title
          Text('Watch List',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          /// List View
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => MovieListItem(object: listProvider.moviesList[index]),
              separatorBuilder: (context, index) =>
                  Divider(color: MyThemeData.lightGreyColor),
              itemCount: listProvider.moviesList.length,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

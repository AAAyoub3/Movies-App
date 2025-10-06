import 'package:flutter/material.dart';
import 'package:movies/data/API/api_manager.dart';
import 'package:movies/home/MovieList_item.dart';

import '../../data/model/search_resource.dart';
import '../../data/model/movie_model.dart';


class SearchResult extends StatefulWidget {
  final String title;
  const SearchResult({super.key, required this.title});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResource?>(
        future: ApiManager.getSearch(widget.title),
        builder: (context, snapshot) {
          SearchResource? searchResponse = snapshot.data;
          List<Movie>? searchList = searchResponse?.results;

          /// If it is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }

          /// User Error
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(searchResponse?.statusMessage ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }

          /// API Error
          if (searchResponse?.results == null) {
            return Center(
                heightFactor: MediaQuery.of(context).size.height * 0.0062,
                child: Image.asset("assets/images/Group 22.png"));
          }

          /// movies found
          return Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      MovieListItem(object: searchList?[index]),
                  itemCount: searchList?.length));
        });
  }
}

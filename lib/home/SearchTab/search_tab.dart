import 'package:flutter/material.dart';
import 'package:movies/home/SearchTab/search_result.dart';
import '../../utils/my_theme.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String title = '';
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.08),

        Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*0.07,
          child: TextField(
            onChanged: (value) {setState(() {title = value;});},
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_rounded,
                color: MyThemeData.whiteColor,
              ),
              hintText: "Search",
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: MyThemeData.greyColor,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: MyThemeData.whiteColor,
                    width: 1
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: MyThemeData.whiteColor,
                    width: 1
                ),
              ),
              //icon: Icon(Icons.search_rounded)
            ),
          ),
        ),

        SearchResult(title: title)
      ],
    );
  }
}

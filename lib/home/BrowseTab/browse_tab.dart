import 'package:flutter/material.dart';
import '../../data/API/api_manager.dart';
import '../../data/model/discover_resource.dart';
import '../../data/model/categories_resource.dart';
import 'card_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Future.wait([ApiManager.getCategory(), ApiManager.getDiscover()]),
        builder: (context, snapshot) {
          /// If it is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          }

          var categoryResponse = snapshot.data![0] as CategoriesResource;
          var discoverResponse = snapshot.data![1] as DiscoverResource;

          var categoryList = categoryResponse.genres;
          var discoverList = discoverResponse.results;

          return Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                /// title
                Text(
                  'Browse Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                /// grid view
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) => CardItem(
                      title: categoryList[index].name!,
                      id: categoryList[index].id!,
                      list: discoverList,
                    ),
                    itemCount: categoryList!.length,
                    padding: const EdgeInsets.all(0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 15),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

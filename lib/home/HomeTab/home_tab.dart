import 'package:flutter/material.dart';
import 'package:movies/data/model/movie_model.dart';
import 'package:movies/home/HomeTab/HorizontalSliderWidget.dart';
import 'package:movies/home/HomeTab/PopularWidget.dart';
import 'dart:async';

import '../../data/API/api_manager.dart';
import '../../data/model/popular_resource.dart';
import '../../data/model/recommend_resource.dart';
import '../../data/model/new_releases_resource.dart';



class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController _pageController;
  late List<Movie> popularList;
  late List<Movie>  releaseList;
  late List<Movie>  recommendList;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    Timer.periodic(const Duration(seconds: 10), (Timer timer) { /// Duration to the run this code section
        if (_pageController.hasClients) {
        var nextPage = _pageController.page! + 1;

        if (nextPage >= popularList!.length) { /// Reached the end then start over
          _pageController.jumpToPage(0);
        }
        else {
          _pageController.nextPage( /// Switching to the next page
            duration: const Duration(seconds: 1), /// swapping duration
            curve: Curves.easeInOut, /// Speed of swapping
            /// easeIn : slow start , easeOut : slow end , easeInOut smooth transition between start & end
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([ApiManager.getPopular(), ApiManager.getRelease(), ApiManager.getRecommended()]),
        builder: (context, snapshot) {
          /// If he is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Theme
                .of(context)
                .primaryColor));
          }

          var popularResponse = snapshot.data![0] as PopularResource;
          var releasesResponse = snapshot.data![1] as NewReleasesResource;
          var recommendResponse = snapshot.data![2] as RecommendResource;



          /// User Error
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(popularResponse.statusMessage ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }

          /// API Error
          if (popularResponse.results == null) {
            return Column(
              children: [
                Text(popularResponse.statusMessage ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
              ],
            );
          }

          popularList = popularResponse.results!;
          releaseList = releasesResponse.results!;
          recommendList = recommendResponse.results!;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                /// popular
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        PopularMoviesWidget(
                          index: index,
                          list: popularList,
                        ),
                    itemCount: popularList.length,
                  ),
                ),

                const SizedBox(height: 15,),

                /// new releases
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: HorizontalSliderWidget(
                    title: "New Releases",
                    list: releaseList,
                  ),
                ),

                const SizedBox(height: 15,),

                /// recommended
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: HorizontalSliderWidget(
                    title: "Recommended",
                    list: recommendList,
                    recommended: true,
                    ),
                ),

                const SizedBox(height: 15,),
              ],
            ),
          );
        });
  }

}


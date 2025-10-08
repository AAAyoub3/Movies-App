import 'package:flutter/material.dart';
import '../utils/my_theme.dart';
import 'BrowseTab/browse_tab.dart';
import 'HomeTab/home_tab.dart';
import 'SearchTab/search_tab.dart';
import 'WatchListTab/watch_list_tab.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      backgroundColor: MyThemeData.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Home",
              backgroundColor: MyThemeData.blackColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: "Search",
              backgroundColor: MyThemeData.blackColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: "Browse",
              backgroundColor: MyThemeData.blackColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: "WatchList",
              backgroundColor: MyThemeData.blackColor),
        ],
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    const HomeTab(),
    SearchTab(),
    const BrowseTab(),
    const WatchListTab(),
  ];

}

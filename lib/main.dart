import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/home/MovieDetailsScreen.dart';
import 'package:provider/provider.dart';
import 'home/BrowseTab/FilteredScreen.dart';
import 'home/homescreen.dart';
import 'utils/provider.dart';
import 'utils/myTheme.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Ensure authentication (anonymous)
  // if (FirebaseAuth.instance.currentUser == null) {
  //   await FirebaseAuth.instance.signInAnonymously();
  // }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderList(),),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        MovieDetailsScreen.routeName : (context) => const MovieDetailsScreen(),
        FilterScreen.routeName : (context) => FilterScreen(),
      },
    );
  }
}

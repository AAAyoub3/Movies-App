import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/model/movie_model.dart';
import '../data/firebase_utils.dart';

class ProviderList extends ChangeNotifier {
  List<Movie> moviesList = [];

  Future<void> getAllMoviesFromFireStore() async{
    QuerySnapshot<Movie> querySnapshot = await FirebaseUtils.getMoviesCollection().get();
    moviesList = querySnapshot.docs.map((doc){return doc.data();}).toList();
    notifyListeners();
  }

  // Future<void> addMovie(Movie movie) async {
  //   await FirebaseUtils.addMovieToFireStore(movie);
  //   moviesList.add(movie);
  //   notifyListeners();
  // }
  //
  // Future<void> removeMovie(String id) async {
  //   await FirebaseUtils.deleteMovieFromFireStore(id);
  //   moviesList.removeWhere((m) => m.id == id);
  //   notifyListeners();
  // }
  //
  // bool isSaved(num? id) {
  //   return moviesList.any((m) => m.id == id);
  // }
}
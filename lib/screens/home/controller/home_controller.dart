import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_test/model/PopularMovieModel.dart';
import 'package:practical_test/services/get_popular_movies.dart';

class HomeController extends GetxController {

  Rx<PageController> pageController = PageController().obs;


  PopularMovieModel popularMovieModel = PopularMovieModel();
  RxList<Results> popularMovieList = <Results>[].obs;
  RxList<Results> topRatedMovieList = <Results>[].obs;
  RxList<Results> nowPlayingMovieList = <Results>[].obs;
  RxList<Results> upcomingMovieList = <Results>[].obs;

  RxBool isLoading = false.obs;

  Future getPopularMovies() async {
    isLoading.value = true;
    try {
      var response = await GetMoviesService().getPopularMovies();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("GetResp: ${response.data}");
        }
        popularMovieModel = PopularMovieModel.fromJson(response.data);
        for (var element in popularMovieModel.results!) {
          popularMovieList.add(element);
          log(element.title!, name: "MOVIE NAME :- Popular");
        }
        isLoading.value = false;
        getNowPlyingMovies();
      }
    } catch (e) {
      if (kDebugMode) {
        print("error is :- $e");
      }
      isLoading.value = false;
    }
  }

  Future getNowPlyingMovies() async {
    isLoading.value = true;
    try {
      var response = await GetMoviesService().getNowPlayingMovies();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("GetResp: ${response.data}");
        }
        List theaterMovieList = response.data["results"];
        if (kDebugMode) {
          print("theaterMovieList: ${theaterMovieList.length}");
        }
        for (var element in theaterMovieList) {
          nowPlayingMovieList.add(Results.fromJson(element));
          log(nowPlayingMovieList[0].title!, name: "MOVIE NAME :- Now playing");
        }
        getTopRatedMoviesList();
        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("error is :- $e");
      }
      isLoading.value = false;
    }
  }

  Future getTopRatedMoviesList() async {
    isLoading.value = true;
    try {
      var response = await GetMoviesService().getTopRatedMovies();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("GetResp: ${response.data}");
        }
        popularMovieModel = PopularMovieModel.fromJson(response.data);
        for (var element in popularMovieModel.results!) {
          topRatedMovieList.add(element);
          log(element.title!, name: "MOVIE NAME:- TOP Rated");
        }
        getUpcomingMoviesList();
        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("error is :- $e");
      }
      isLoading.value = false;
    }
  }

  Future getUpcomingMoviesList() async {
    isLoading.value = true;
    try {
      var response = await GetMoviesService().getUpcomingMovies();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("GetResp: ${response.data}");
        }
        List upcomingMovies = response.data["results"];
        if (kDebugMode) {
          print("upcomingMovieList: ${upcomingMovieList.length}");
        }
        for (var element in upcomingMovies) {
          upcomingMovieList.add(Results.fromJson(element));
          log(upcomingMovieList[0].title!, name: "MOVIE NAME :- UP Coming");
        }
        isLoading.value = false;
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print("error is :- $e");
      }
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPopularMovies();
  }
}

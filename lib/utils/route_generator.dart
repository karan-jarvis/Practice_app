import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_test/common_widgets/bottom_bar.dart';
import 'package:practical_test/screens/home/page/home_screen.dart';
import 'package:practical_test/screens/movie_preview/page/movie_preview_screen.dart';
import 'package:practical_test/utils/route_constants.dart';

///
/// RouteGenerator class generate route to navigation and navigation animations
/// [RouteConstants] defined in file in constant folder
///
///

class RouteGenerater {
  /// this function will return  all routes in list
  List<GetPage> getAllRoute() {
    List<GetPage> pages = [
      getPageAnimationR2L(
          name: RoutesConstants.bottomBar, page: const BottomBar()),
      getPageAnimationR2L(name: RoutesConstants.homeScreen, page: HomeScreen()),
      getPageAnimationR2L(
          name: RoutesConstants.moviePreview, page: const MoviePreviewScreen()),
    ];
    return pages;
  }

  /// This function return  with animation [Right To Left]
  GetPage getPageAnimationR2L({required String name, required Widget page}) {
    return GetPage(
      name: name,
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// if anything goes wrong with route this page will be there
  /// you can find file in the same folder
  GetPage getUndefinedRoute() {
    GetPage page =
        GetPage(name: RoutesConstants.homeScreen, page: () => Container());
    return page;
  }
}

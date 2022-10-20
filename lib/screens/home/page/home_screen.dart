import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practical_test/common_widgets/common_list_view.dart';
import 'package:practical_test/common_widgets/title_bar_common_widget.dart';
import 'package:practical_test/screens/home/controller/home_controller.dart';
import 'package:practical_test/utils/color_utils.dart';
import 'package:practical_test/utils/text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(CupertinoIcons.list_bullet,
                color: AppColors.primaryColor),
            onPressed: () {}),
        title: const Text("Hello Sunshine",
            style: TextStyle(color: AppColors.primaryColor)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search,
                color: AppColors.primaryColor),
          ),
        ],
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    TitleBarWidget(
                        title: "What's Popular", onTapViewAll: () {}),
                    CommonListView(
                        movieDetailList: homeController.popularMovieList),
                    SizedBox(
                      height: 10.h,
                    ),
                    TitleBarWidget(
                        title: "Playing In Theaters", onTapViewAll: () {}),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: homeController.pageController.value,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primaryColor,
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://m.media-amazon.com/images/I/51BANINoAxL.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                margin: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: AppColors.black.withOpacity(0.5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        CupertinoIcons.play_circle_fill,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    "Watch now",
                                    style: headingTextStyle.copyWith(
                                        color: AppColors.white),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                        itemCount: homeController
                            .nowPlayingMovieList.length, // Can be null
                      ),
                    ),
                    SmoothPageIndicator(
                        controller: homeController.pageController.value,
                        // PageController
                        count: homeController.nowPlayingMovieList.length,
                        effect: const ScrollingDotsEffect(), // WormEffect(),
                        // your preferred effect
                        onDotClicked: (index) {}),
                    TitleBarWidget(title: "Trending", onTapViewAll: () {}),
                    CommonListView(
                        movieDetailList: homeController.popularMovieList),
                    SizedBox(
                      height: 10.h,
                    ),
                    TitleBarWidget(title: "Top Rated", onTapViewAll: () {}),
                    SizedBox(
                      height: 280.h,
                      child: ListView.builder(
                        itemCount: homeController.topRatedMovieList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 120.h,
                                width: 250,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                height: 140,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  homeController
                                                      .topRatedMovieList[index]
                                                      .title!,
                                                  style: headingTextStyle
                                                      .copyWith(fontSize: 18)),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              CupertinoIcons.star_fill,
                                              color: AppColors.primaryColor,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(homeController
                                                .topRatedMovieList[index]
                                                .voteAverage
                                                .toString())
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "Genre ${homeController.topRatedMovieList[index].genreIds!.toString()}",
                                          style: headingTextStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    TitleBarWidget(title: "Upcoming", onTapViewAll: () {}),
                    CommonListView(
                        movieDetailList: homeController.upcomingMovieList),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

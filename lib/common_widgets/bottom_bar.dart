import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_test/screens/home/page/home_screen.dart';
import 'package:practical_test/utils/color_utils.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            const Center(child: Text("Play Screen")),
            const Center(child: Text("Account Screen"))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: _currentIndex,
        containerHeight: 60,
        iconSize: 25,
        onItemSelected: (index) {
          // setState(() => _currentIndex = index);
          // _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.grey,
              textAlign: TextAlign.center,
              title: Text(
                'Movies',
                style: TextStyle(
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.movie_sharp,
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              )),
          BottomNavyBarItem(
              inactiveColor: AppColors.primaryColor,
              title: const Text('Play'),
              icon: const Icon(
                Icons.apps,
              )),
          BottomNavyBarItem(
              inactiveColor: AppColors.primaryColor,
              title: const Text("Account"),
              icon: const Icon(Icons.chat_bubble)),
        ],
      ),
    );
  }
}

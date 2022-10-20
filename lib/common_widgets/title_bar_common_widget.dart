import 'package:flutter/material.dart';
import 'package:practical_test/utils/color_utils.dart';
import 'package:practical_test/utils/text_style.dart';

class TitleBarWidget extends StatelessWidget {
  TitleBarWidget({Key? key, required this.title,required this.onTapViewAll}) : super(key: key);

  String title;
  Function() onTapViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: headingTextStyle,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => onTapViewAll,
            child: Row(
              children: [
                Text(
                  "View All",
                  style: semiTitleTextStyle,
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: AppColors.lightPurpleColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

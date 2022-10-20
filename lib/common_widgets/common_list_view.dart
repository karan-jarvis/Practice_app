import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:practical_test/model/PopularMovieModel.dart';
import 'package:practical_test/utils/text_style.dart';

class CommonListView extends StatelessWidget {
  CommonListView({Key? key, required this.movieDetailList}) : super(key: key);

  List<Results> movieDetailList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        itemCount: movieDetailList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        //headers: {"api_key":"83a3b3948b8eaa39564197e5e90e46e0"},
                        "https://m.media-amazon.com/images/I/71niXI3lxlL._SY679_.jpg",
                        //"baseUrl + movieDetailList[index].posterPath!",
                        fit: BoxFit.fill,
                        height: 150,
                        width: 110),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    movieDetailList[index].title!,
                    textAlign: TextAlign.start,
                    style: headingTextStyle.copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    DateFormat.yMMMd().format(
                        DateTime.parse(movieDetailList[index].releaseDate!)),
                    style: headingTextStyle.copyWith(
                        fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

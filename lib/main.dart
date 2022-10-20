import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practical_test/utils/route_constants.dart';
import 'package:practical_test/utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ScreenUtilInit(
        builder: (context, widget) => GetMaterialApp(
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              /// this MediaQuery will override text size changes from users device setting
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? const SizedBox(),
            );
          },
          debugShowCheckedModeBanner: false,
          // theme: ThemeData().copyWith(
          //   textTheme: GoogleFonts.poppinsTextTheme(
          //     Theme.of(context).textTheme,
          //   ),
          // ),
          getPages: RouteGenerater().getAllRoute(),
          initialRoute: RoutesConstants.bottomBar,
          unknownRoute: RouteGenerater().getUndefinedRoute(),
          title: 'TMS App',
        ),
      );
    });
  }
}

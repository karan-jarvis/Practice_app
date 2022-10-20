import 'package:flutter/material.dart';
import 'package:practical_test/utils/color_utils.dart';

class MoviePreviewScreen extends StatelessWidget {
  const MoviePreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
    );
  }
}

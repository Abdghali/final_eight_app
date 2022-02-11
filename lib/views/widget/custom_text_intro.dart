import 'package:final_eight_app/utilities/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextIntro extends StatelessWidget {
  String? titleOne;
  String? titleTwo;
  CustomTextIntro({Key? key, this.titleOne, this.titleTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${titleOne!}", style: AppStyle.appStyle.introTextStyle),
        Text("${titleTwo!}", style: AppStyle.appStyle.introTextStyle),
      ],
    );
  }
}

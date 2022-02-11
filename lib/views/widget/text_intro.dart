import 'package:final_eight_app/utilities/app_style.dart';
import 'package:flutter/material.dart';
class TextIntro extends StatelessWidget {
 String? titleOne;
  String? subTitle;
  TextStyle? titleOneTextStyle;
  TextStyle? subTitleStyle;
  double? pading;
  CrossAxisAlignment? crossAxisAlignment;
  TextIntro({Key? key, this.titleOne, this.subTitle,this.titleOneTextStyle,this.subTitleStyle,this.pading=30,this.crossAxisAlignment=CrossAxisAlignment.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: [
        Text("${titleOne!}", style: titleOneTextStyle??AppStyle.appStyle.introTextStyle),
         SizedBox(
          height:pading,
        ),
        Text("${subTitle!}", style: subTitleStyle??AppStyle.appStyle.introTextStyle),
      ],
    );
  }
}

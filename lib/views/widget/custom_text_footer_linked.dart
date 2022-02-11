import 'package:final_eight_app/utilities/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFooterLinked extends StatelessWidget {
  String? textOne;
  TextStyle? textOneStyle;
  String? linkedText;
  TextStyle? linkedTextStyle;
  Function()? onclickLinkedText;
  CustomTextFooterLinked({this.linkedText, this.textOne="", this.onclickLinkedText,this.textOneStyle,this.linkedTextStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textOne!,
          style:textOneStyle?? const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap:()=> onclickLinkedText!(),
          child: Text(
            linkedText!,
            style: linkedTextStyle??AppStyle.appStyle.underLineTextStylewight,
          ),
        ),
      ],
    );
  }
}

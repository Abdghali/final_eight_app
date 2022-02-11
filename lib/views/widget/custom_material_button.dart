import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  String? title;
  TextStyle? titleTextStyle;
  Color? buttonColor;
  Color? textColor;
  Function()? onClick;
  Icon? icon;
  TextDirection? textDirection;
  CustomMaterialButton(
      {this.title,
      this.buttonColor,
      this.onClick,
      this.textColor,
      this.icon,
      this.textDirection = TextDirection.ltr,
      this.titleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 45,
        child: MaterialButton(
          color: buttonColor!,
          textColor: textColor,
          shape: const StadiumBorder(),
          onPressed: () => onClick!(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            Wrap(
              textDirection: textDirection,
              children: [
                icon != null ? icon! : Container(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title!,
                  style: titleTextStyle,
                )
              ],
            ),
          ]),
        ));
  }
}

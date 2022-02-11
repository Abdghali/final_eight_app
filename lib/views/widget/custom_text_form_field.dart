import 'package:final_eight_app/utilities/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? labelText;
  String? suffixText;
  TextEditingController? textEditingController;
  Function(String value)? onchange;
  Widget? prefix;
  TextStyle? labelStyle;
  Key? key;
  CustomTextFormField(
      {this.labelText,
      this.suffixText = "",
      this.textEditingController,
      this.onchange,
      this.prefix,
      this.labelStyle,
      this.key

      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      onChanged: onchange!,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText!,
        prefix: prefix,
        prefixStyle:const TextStyle(color: Colors.black) ,
        suffixStyle: const TextStyle(color: Colors.white),
        labelStyle: labelStyle??const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusColor: Colors.white,
        fillColor: Colors.white,
        focusedBorder: AppStyle.appStyle.underlineInputBorderWightWightColor,
        enabledBorder: AppStyle.appStyle.underlineInputBorderWightWightColor,
      ),
    );
  }
}

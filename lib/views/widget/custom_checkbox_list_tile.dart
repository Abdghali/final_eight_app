import 'package:flutter/material.dart';

class CustomCheckBoxListTile extends StatelessWidget {
  String? title;
  bool? checkedValue;
  Function(bool newValue)? onchange;

  CustomCheckBoxListTile({this.title, this.checkedValue, this.onchange});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title!,
        style: TextStyle(color: Colors.white),
      ),
      value: checkedValue,
      checkColor: Colors.grey,
      activeColor: Colors.white,
      onChanged: (newvalue) {
        onchange!(newvalue!);
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}

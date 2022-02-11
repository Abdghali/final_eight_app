import 'package:flutter/material.dart';
class CustomBoxShadowContainer extends StatelessWidget {
  const CustomBoxShadowContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.85),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
          );
  }
}
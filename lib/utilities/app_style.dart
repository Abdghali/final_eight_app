import 'package:flutter/material.dart';

class AppStyle {
  AppStyle._();
  static AppStyle appStyle = AppStyle._();

  final introTextStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white);
  final h1_introTextStyle =
      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  final h3_introTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  final h2_introTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  

  final titleProductItem =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  final subTitleProductItem =
      const TextStyle(fontSize: 18, color: Colors.grey);
  final cardIntroTextStyleLeft = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white);

  final cardIntroTextStyleRight = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white);
  final cardButtonTextStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);


  final collectionSliderTitleStyle = const   TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white);
  final collectionSliderSubTitleStyle = const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white);
 
 final collectionListTileTitleStyle = const   TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  final collectionListTileSubTitleStyle = const  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey);




  final underLineTextStylewight = const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  final underLineTextStyleblack = const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      color: Colors.black);
      final underLineTextStyleGray = const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.normal,
      color: Colors.grey);

  ///Borders
  final underlineInputBorderWightWightColor = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );
  final underlineInputBorderWightGrayColor = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}

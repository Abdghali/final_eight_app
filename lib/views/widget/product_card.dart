import 'package:final_eight_app/utilities/app_style.dart';
import 'package:final_eight_app/views/widget/text_intro.dart';
import 'package:flutter/material.dart';

class UserItemCard extends StatefulWidget {
  String? imageUrl;
  String? productName;
  String? price;
  Function()? delete;

  UserItemCard(
      {Key? key, this.imageUrl, this.price, this.productName, this.delete})
      : super(key: key);

  @override
  _UserItemCardState createState() => _UserItemCardState();
}

class _UserItemCardState extends State<UserItemCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(10),
          child: Image.asset(widget.imageUrl!),
        ),
        TextIntro(
          titleOne: "${widget.productName}",
          subTitle: 'Phone : ${widget.price}',
          pading: 10,
          titleOneTextStyle: AppStyle.appStyle.titleProductItem,
          subTitleStyle: AppStyle.appStyle.subTitleProductItem,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
              onPressed: widget.delete,
              icon: Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 30,
              )),
        )
      ],
    );
  }
}

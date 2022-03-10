import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key key}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool val1 = true;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                val1 = !val1;
              });
            },
            child: buildContainer(
              'Issue Activity',
              val1,
            )),
        Divider(
          color: KColor.grey.withOpacity(0.3),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                val2 = !val2;
              });
            },
            child: buildContainer(
              'Tracking Activity',
              val2,
            )),
        Divider(
          color: KColor.grey.withOpacity(0.3),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                val3 = !val3;
              });
            },
            child: buildContainer(
              'New Comments',
              val3,
            )),
        Divider(
          color: KColor.grey.withOpacity(0.3),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                val4 = !val4;
              });
            },
            child: buildContainer(
              'New Task Requests',
              val4,
            )),
        Divider(
          color: KColor.grey.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget buildContainer(String text, bool value) {
    return Container(
      height: KSize.getHeight(context, 62),
      color: KColor.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: KTextStyle.subTitle1.copyWith(color: KColor.black),
          ),
          Container(
            height: KSize.getHeight(context, 31),
            width: KSize.getWidth(context, 51),
            decoration: BoxDecoration(
                color: value == true ? KColor.primary : KColor.whiteSmoke,
                borderRadius: BorderRadius.circular(18)),
            child: Align(
              alignment:
                  value == true ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 5)),
                child: Image.asset('assets/images/Oval.png',
                    height: KSize.getHeight(context, 23),
                    width: KSize.getWidth(context, 23),
                    color: value == true ? KColor.white : KColor.lightGrey,
                    scale: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

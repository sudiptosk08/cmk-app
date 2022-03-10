// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

import 'package:flutter_app/view/screens/message/message_groups_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

// ignore: must_be_immutable
class GroupList extends StatefulWidget {
  String imagePath;
  String teamName;
  String teamMember;
  String titleTxt;
  String time;

  GroupList({
    Key key,
    this.imagePath,
    this.teamName,
    this.teamMember,
    this.titleTxt,
    this.time,
  }) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          context.nextPage(const MessageGroupScreen());
        },
        child: Row(
          children: [
            Image.asset(
              widget.imagePath,
              height: KSize.getHeight(context, 40),
              width: KSize.getWidth(context, 40),
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: KSize.getWidth(context, 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Team Align
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: widget.teamName, style: KTextStyle.bodyText),
                  TextSpan(
                      text: " (${widget.teamMember})", style: KTextStyle.overLine),
                ])),
                SizedBox(
                  height: KSize.getHeight(context, 5),
                ),
                Text(
                  widget.titleTxt,
                  style: KTextStyle.caption,
                )
              ],
            ),
            const Spacer(),
            Text(widget.time,
                style: KTextStyle.overLine.copyWith(color: KColor.grey))
          ],
        ),
      ),
    );
  }
}

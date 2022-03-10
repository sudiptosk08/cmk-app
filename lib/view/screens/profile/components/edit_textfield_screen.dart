import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class EditTextFieldScreen extends StatefulWidget {
  final String hintText;
  final TextInputType type;

  const EditTextFieldScreen({Key key, this.hintText, this.type})
      : super(key: key);

  @override
  _EditTextFieldScreenState createState() => _EditTextFieldScreenState();
}

class _EditTextFieldScreenState extends State<EditTextFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: KSize.getHeight(context, 65),
      child: TextField(
        style: KTextStyle.subTitle1.copyWith(color: KColor.black, fontSize: 18),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: KTextStyle.subTitle1,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 16))),
      ),
    );
  }
}

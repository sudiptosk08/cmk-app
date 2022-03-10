import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class KButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const KButton({
    Key key,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: KSize.getHeight(context, 58),
        decoration: BoxDecoration(
          color: KColor.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        width: context.screenWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: KColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          onPressed: onPressed,
          child: Text(buttonText, style: KTextStyle.bodyText4),
        ));
  }
}

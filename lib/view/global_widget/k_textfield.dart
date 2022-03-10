
import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class KTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final String image;
  final bool isPasswordField;
  final bool isUserNameField;

  // ignore: prefer_typing_uninitialized_variables
  final suffixIcon;
  final TextEditingController controller;
  //final TextInputType type;

  const KTextField({
    Key key,
    this.hintText,
    this.icon,
    this.image,
    this.isPasswordField = false,
    this.isUserNameField = false,
    this.suffixIcon,
    this.controller,
    //this.type,
  }) : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: KSize.getHeight(context, 65),
      child: Center(
        child: TextField(
            //keyboardType: widget.type,
            controller: widget.controller,
            obscureText: widget.hintText == 'Password' ||
                    widget.hintText == 'Confirm Password'
                ? _obscureText
                : false,
            textAlignVertical:
                widget.isPasswordField ? TextAlignVertical.center : null,
            style: KTextStyle.bodyText,
            decoration: InputDecoration(
                suffixIcon: widget.isPasswordField
                    ? obscureTextWidget()
                    : widget.suffixIcon != null && widget.isUserNameField
                        ? widget.controller.text.isEmpty
                            ? null
                            : widget.suffixIcon
                        : null,
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        const BorderSide(color: KColor.whiteSmoke, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: KColor.whiteSmoke),
                    borderRadius: BorderRadius.circular(10.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                hintText: widget.hintText,
                hintStyle: KTextStyle.subTitle1),
            onChanged: (val) {
              setState(() {});
            }),
      ),
    );
  }

  InkWell obscureTextWidget() {
    return InkWell(
        onTap: () {
          _toggle();
        },
        child: _obscureText
            ? Image.asset(
                'assets/images/eye.png',
                height: KSize.getHeight(context, 8),
                width: KSize.getWidth(context, 10.63),
                scale: 2.4,
              )
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: KSize.getHeight(context, 16),
                  width: KSize.getWidth(context, 16),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: KColor.whiteSmoke),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Image.asset(
                      'assets/images/visibleEye.png',
                      height: KSize.getHeight(context, 10),
                      width: KSize.getWidth(context, 10.63),
                      scale: 2.4,
                    ),
                  ),
                ),
              ));
  }
}

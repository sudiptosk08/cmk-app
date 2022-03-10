import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

// ignore: must_be_immutable
class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;
  final bool automaticallyImplyLeading;
  final double titleSpacing;
  final bool centerTitle;
  final bool isCustomLeading;
  final IconData customIcon;
  final Widget customTitle;
  Function onPressed;
  final List<Widget> customAction;

  // ignore: use_key_in_widget_constructors
  KAppBar({
    Key key,
    this.title,
    this.elevation = 0,
    this.centerTitle = false,
    this.titleSpacing = 0,
    this.automaticallyImplyLeading = true,
    this.isCustomLeading = false,
    this.customIcon,
    this.customTitle,
    this.onPressed,
    this.customAction,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColor.transparent,
      elevation: elevation,
      titleSpacing: !automaticallyImplyLeading
          ? NavigationToolbar.kMiddleSpacing
          : titleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: const IconThemeData(color: KColor.primary),
      leading: isCustomLeading
          ? InkWell(
             onTap: onPressed,
              child: const Icon(Icons.arrow_back_sharp)
              )
          : null,
      centerTitle: centerTitle,
      // ignore: prefer_if_null_operators
      title: customTitle != null
          ? customTitle
          : title != null
              ? Text(title, style: KTextStyle.bodyText)
              : null,
      actions: customAction,
    );
  }
}

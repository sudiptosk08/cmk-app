import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class ECAppDetailsScreen extends StatelessWidget {
  const ECAppDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
          isCustomLeading: true,
          centerTitle: true,
          title: 'E-C App',
          onPressed: () {
            Navigator.of(context).pop();
          }),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),
              Text(
                'Requirements for E-Commerce App',
                style: KTextStyle.headline8.copyWith(fontSize: 18),
              ),
              SizedBox(height: KSize.getHeight(context, 40)),
              Text(
                'When developing the site,predominantly light styles should be used. The main sections of the site should be accessible from the first page. The first page should not contain a lot of text information.\n\nThe site design should not include:\n- flashing banners;\n- a lot of merging text.',
                textAlign: TextAlign.justify,
                style: KTextStyle.bodyText2.copyWith(
                    color: KColor.grey,
                    fontWeight: FontWeight.w300,
                    
                    height: 2.2),
              ),
              SizedBox(height: KSize.getHeight(context, 30)),
              Image.asset(
                'assets/images/Images.png',
              ),
              SizedBox(height: KSize.getHeight(context, 30)),
            ],
          ),
        ),
      ),
    );
  }
}

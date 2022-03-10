import 'package:flutter/material.dart';
import 'package:flutter_app/model/category_model.dart';
import 'package:flutter_app/view/screens/ecapp/e_c_app_details_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: KSize.getWidth(context, 41),
            mainAxisSpacing: KSize.getHeight(context, 30)),
        itemCount: categoryList.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.nextPage(const ECAppDetailsScreen());
            },
            child: Container(
              height: KSize.getHeight(context, 138),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(-2, 1),
                        color: KColor.snow,
                        blurRadius: 10,
                        spreadRadius: 10),
                    BoxShadow(
                      color: KColor.snow,
                      blurRadius: 15.0,
                      offset: Offset(10.0, 10.0),
                    ),
                  ],
                color: KColor.white,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 20)),
                  Image.asset(
                    categoryList[index].image,
                    fit: BoxFit.cover,
                    height: KSize.getHeight(context, 44),
                    width: KSize.getWidth(context, 44),
                  ),
                  SizedBox(height: KSize.getHeight(context, 12)),
                  Text(categoryList[index].title,
                      style: KTextStyle.bodyText),
                  SizedBox(height: KSize.getHeight(context, 12)),
                  Text(categoryList[index].subTitle,
                      style: KTextStyle.bodyText2.copyWith(color: KColor.grey,height:1)),
                ],
              ),
            ),
          );
        });
  }
}

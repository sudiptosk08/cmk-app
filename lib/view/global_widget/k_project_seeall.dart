import 'package:flutter/material.dart';
import 'package:flutter_app/view/screens/project/all_project_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class KProjectSeeAll extends StatelessWidget {
  const KProjectSeeAll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.nextPage(const AllProjectsScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Projects',
            style: KTextStyle.headline8,
          ),
          Text(
            'See all',
            style: KTextStyle.caption.copyWith(color: KColor.primary),
          ),
        ],
      ),
    );
  }
}

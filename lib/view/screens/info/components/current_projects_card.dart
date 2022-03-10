import 'package:flutter/material.dart';
import 'package:flutter_app/view/screens/info/components/line_chart_widget.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class CurrentProjectsCard extends StatefulWidget {
  const CurrentProjectsCard({Key key}) : super(key: key);

  @override
  State<CurrentProjectsCard> createState() => _CurrentProjectsCardState();
}

class _CurrentProjectsCardState extends State<CurrentProjectsCard> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 240),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: const [
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
      ], color: KColor.white, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: KSize.getWidth(context, 30),
            vertical: KSize.getHeight(context, 26)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Projects',
              style: KTextStyle.button.copyWith(height: 1),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15',
                      style: KTextStyle.headline3.copyWith(height: 1),
                    ),
                    SizedBox(height: KSize.getHeight(context, 10)),
                    Text(
                      'Growth +3',
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.violet, height: 0.5),
                    )
                  ],
                ),
               const LineChartWidget(),
              ],
            ),
            const Spacer(),
            Text(
              'Ongoing Projects Last Month - 13',
              style: KTextStyle.caption.copyWith(height: 1),
            ),
          ],
        ),
      ),
    );
  }
}

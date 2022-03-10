import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/screens/event/event_details_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class AllEventsScreen extends StatefulWidget {
  const AllEventsScreen({Key key}) : super(key: key);

  @override
  State<AllEventsScreen> createState() => _AllEventsScreenState();
}

class _AllEventsScreenState extends State<AllEventsScreen> {
  final List<String> lineImageList = [
    'assets/images/blueLine.png',
    'assets/images/line2.png',
    'assets/images/line3.png',
    'assets/images/line4.png',
  ];

  final List<String> titleList = [
    'Presentation of the\nnew app launch',
    'Presentation of the\nnew app launch',
    'Starting business of\nmarketings',
    'Management\nCommunity of UI',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'All Events',
        centerTitle: true,
        //isCustomLeading: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: KColor.white,
      body: Column(
        children: [
          SizedBox(height: KSize.getHeight(context, 44)),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: lineImageList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.nextReplacementPage(const EventDetailsScreen());
                    },
                    child: Container(
                      height: KSize.getHeight(context, 148),
                      width: KSize.getWidth(context, 300),
                      margin: EdgeInsets.only(
                          left: KSize.getWidth(context, 24),
                          right: KSize.getWidth(context, 24),
                          bottom: KSize.getHeight(context, 40)),
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
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: KSize.getWidth(context, 20),
                                vertical: KSize.getHeight(context, 22)),
                            child: Image.asset(
                              lineImageList[index],
                              height: KSize.getHeight(context, 104),
                              width: KSize.getWidth(context, 4),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: KSize.getHeight(context, 30),
                              bottom: KSize.getHeight(context, 29),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(titleList[index],
                                    style: KTextStyle.bodyText
                                        .copyWith(height: 1.3)),
                                const Spacer(),
                                Text('Today | 5:00 PM',
                                    style: KTextStyle.bodyText2.copyWith(
                                        color: KColor.grey, height: 1)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: KSize.getHeight(context, 90),
                                bottom: KSize.getHeight(context, 22),
                                right: KSize.getWidth(context, 14)),
                            child: Container(
                              height: KSize.getHeight(context, 36),
                              width: KSize.getWidth(context, 63),
                              decoration: BoxDecoration(
                                  color: KColor.aliceBlue,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: KSize.getWidth(context, 8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/time.png',
                                      height: KSize.getHeight(context, 16),
                                      width: KSize.getWidth(context, 16),
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '4h',
                                      style: KTextStyle.caption.copyWith(
                                          color: KColor.darkGrey,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //Spacer()
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/view/screens/event/event_details_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class EventListCard extends StatefulWidget {
  const EventListCard({Key key}) : super(key: key);

  @override
  State<EventListCard> createState() => _EventListCardState();
}

class _EventListCardState extends State<EventListCard> {
  final List<String> imageList = [
    'assets/images/blueLine.png',
    'assets/images/line2.png',
    'assets/images/blueLine.png',
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: KSize.getHeight(context, 148),
     
      child: ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.nextPage(const EventDetailsScreen());
              },
              highlightColor: KColor.transparent,
              splashColor: KColor.transparent,
              hoverColor: KColor.transparent,
              child: Card(
                shadowColor: KColor.snow.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(
                    right: KSize.getWidth(context, 20)),
                elevation: 1,
                child: Container(
                  height: KSize.getHeight(context, 148),
                  width: KSize.getWidth(context, 320),
                  decoration: BoxDecoration(
                      color: KColor.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 20),
                            vertical: KSize.getHeight(context, 22)),
                        child: Image.asset(
                          imageList[index],
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
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Presentation of the\nnew app launch',
                                style: KTextStyle.bodyText
                                    .copyWith(height: 1.3)),
                            const Spacer(),
                            Text('Today | 5:00 PM',
                                style: KTextStyle.bodyText2
                                    .copyWith(
                                    color: KColor.grey,
                                    height: 1)),
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
                              borderRadius:
                              BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                KSize.getWidth(context, 8)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/time.png',
                                  height:
                                  KSize.getHeight(context, 16),
                                  width:
                                  KSize.getWidth(context, 16),
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  '4h',
                                  style: KTextStyle.caption
                                      .copyWith(
                                      color: KColor.darkGrey,
                                      fontWeight:
                                      FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //const Spacer()
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

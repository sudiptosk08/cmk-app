import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/calendar_dialog_screen.dart';
import 'package:flutter_app/view/screens/project/project_details_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';
import 'package:velocity_x/velocity_x.dart';


class IosNativeCard extends StatelessWidget {
  const IosNativeCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
      onTap: () {
        context.nextPage(const ProjectDetailsScreen());
      },
      child: Container(
        height: KSize.getHeight(context, 141),
        width: KSize.getWidth(context, 360),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(-2, 1),
              color: KColor.snow,
              blurRadius: 10,
              spreadRadius: 10),
          BoxShadow(
            color: KColor.snow,
            blurRadius: 15.0,
            offset: Offset(20.0, 10.0),
          ),
        ], color: KColor.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            const Spacer(),

            /// Image/ IOS NATIVE/ E COMMERCE APP UI
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
              child: SizedBox(
                height: KSize.getHeight(context, 60),
                child: Row(
                  children: [
                    Image.asset('assets/images/Image.png',
                        height: KSize.getHeight(context, 48),
                        width: KSize.getWidth(context, 48),
                        fit: BoxFit.contain),
                    SizedBox(width: KSize.getWidth(context, 19)),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('IOS NATIVE',
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.grey, height: 1.5)),
                          Text('E-Commerce App Ui',
                              style: KTextStyle.headline8
                                  .copyWith(fontSize: 18, height: 1.2)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: KSize.getHeight(context, 30)),

            /// Calendar  /  created May
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
              child: Row(
                children: [
                  InkWell(
                    highlightColor: KColor.transparent,
                    splashColor: KColor.transparent,
                    hoverColor: KColor.transparent,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const PlatformAlertDialog(
                                title: CalendarDialogScreen());
                          });
                    },
                    child: Image.asset(
                      'assets/images/calendar.png',
                      height: KSize.getHeight(context, 20),
                      width: KSize.getWidth(context, 18),
                      fit: BoxFit.fill,
                      color: KColor.grey,
                    ),
                  ),
                  SizedBox(width: KSize.getWidth(context, 9.98)),
                  Text(
                    'Created May 24,2021',
                    style: KTextStyle.caption.copyWith(fontSize: 13),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: KSize.getHeight(context, 24),
                    width: KSize.getWidth(context, 87),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/photo.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill),
                        Positioned(
                            left: 17,
                            child: Image.asset('assets/images/photo2.png',
                                height: KSize.getHeight(context, 24),
                                width: KSize.getWidth(context, 24),
                                fit: BoxFit.fill)),
                        Positioned(
                            left: 35,
                            child: Image.asset('assets/images/photo3.png',
                                height: KSize.getHeight(context, 24),
                                width: KSize.getWidth(context, 24),
                                fit: BoxFit.fill)),
                        Positioned(
                            left: 50,
                            child: Image.asset('assets/images/blue.png',
                                height: KSize.getHeight(context, 24),
                                width: KSize.getWidth(context, 24),
                                fit: BoxFit.fill)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

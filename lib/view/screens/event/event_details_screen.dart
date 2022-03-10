import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/calendar_dialog_screen.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Event Details',
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 44)),
              Text(
                'Presentation of the\nnew app launch',
                style: KTextStyle.headline8.copyWith(fontSize: 18),
              ),
              SizedBox(height: KSize.getHeight(context, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today | 5:00 PM',
                    style: KTextStyle.caption,
                  ),
                  Container(
                    height: KSize.getHeight(context, 36),
                    width: KSize.getWidth(context, 63),
                    decoration: BoxDecoration(
                        color: KColor.aliceBlue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 40)),

              /// Created By / Invited People
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Created By',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/photo.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: KSize.getWidth(context, 12)),
                          Text('Sami Rafi',
                              style: KTextStyle.subTitle1
                                  .copyWith(color: KColor.black))
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invited People',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
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
                                left: 52,
                                child: Image.asset('assets/images/blue.png',
                                    height: KSize.getHeight(context, 24),
                                    width: KSize.getWidth(context, 24),
                                    fit: BoxFit.fill)),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: KSize.getHeight(context, 40)),

              /// Meeting Link
              Text(
                'Meeting Link',
                style: KTextStyle.bodyText2.copyWith(color: KColor.grey,height: 1.5),
              ),
              SizedBox(height: KSize.getHeight(context, 12)),

              /// Google Meet Link
              Text(
                'https://meet.google.com/tqg-tsrb-qfw',
                style: KTextStyle.bodyText2.copyWith(
                  height: 1.0,
                  color: KColor.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 70)),

              /// Button
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 16)),
                child: KButton(
                  buttonText: 'Set Reminder',
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                                    context: context,
                                    builder: (context) {
                                    return  Dialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                 child: const CalendarDialogScreen());
                           });
                  },
                ),
              ),

              SizedBox(height: KSize.getHeight(context, 313)),
            ],
          ),
        ),
      ),
    );
  }
}

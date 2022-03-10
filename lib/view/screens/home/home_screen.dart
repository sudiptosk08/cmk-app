import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_project_seeall.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/event/all_events_screen.dart';
import 'package:flutter_app/view/global_widget/calendar_dialog_screen.dart';
import 'package:flutter_app/view/screens/home/tabs/event_list_card.dart';
import 'package:flutter_app/view/screens/notifications/notifications_screen.dart';
import 'package:flutter_app/view/screens/profile/edit_profile_screen.dart';
import 'package:flutter_app/view/screens/team/components/ios_native_card.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  HomeScreen({Key key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KColor.transparent,
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Row(
            children: [
              Transform.translate(
                offset: const Offset(-15, 0),
                child: InkWell(
                  onTap: () {
                    appValueNotifier.showBottomNavBar();
                    widget.onMenuPressed();
                  },
                  child:Container(
                    height: 25,
                    width: 60,
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/menu.png',
                      height: KSize.getHeight(context, 17),
                      width: KSize.getWidth(context, 34),
                      fit: BoxFit.contain),)
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.nextPage(const NotificationsScreen());
                },
                child: Image.asset('assets/images/notification.png',
                    height: KSize.getHeight(context, 21),
                    width: KSize.getWidth(context, 18),
                    fit: BoxFit.contain),
              ),
              SizedBox(width: KSize.getWidth(context, 20)),
              Transform.translate(
                offset: const Offset(15, 0),
                child: GestureDetector(
                  onTap: () {
                    context.nextPage(EditProfileScreen());
                  },
                  child: Image.asset('assets/images/profile.png',
                      height: KSize.getHeight(context, 48),
                      width: KSize.getWidth(context, 48),
                      fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: KColor.white,
      body:  SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
            child:
              Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 30)),
                  SizedBox(height: KSize.getHeight(context, 30)),
                  Text(
                    'Hello',
                    style: KTextStyle.headline7,
                  ),
                  Row(
                    children: [
                      Text('Mike Tyson', style: KTextStyle.headline4),
                      SizedBox(width: KSize.getWidth(context, 10)),
                      Image.asset(
                        'assets/images/clap.png',
                        height: KSize.getHeight(context, 26),
                        width: KSize.getWidth(context, 26),
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                  SizedBox(height: KSize.getHeight(context, 30)),
      
                  /// Calendar
                  Container(
                    height: KSize.getHeight(context, 48),
                    color: KColor.whiteShade,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 40)),
                      child: Row(
                        children: [
                          Flexible(
                            child: InkWell(
                              highlightColor: KColor.transparent,
                              splashColor: KColor.transparent,
                              hoverColor: KColor.transparent,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: const CalendarDialogScreen());
                                    });
                              },
                              child: Image.asset(
                                'assets/images/calendar.png',
                                height: KSize.getHeight(context, 20),
                                width: KSize.getWidth(context, 18),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: KSize.getWidth(context, 20)),
                          Text('24 Feb,2021-24 May,2021',
                              style: KTextStyle.subTitle1
                                  .copyWith(color: KColor.black))
                        ],
                      ),
                    ),
                  ),
      
                  SizedBox(height: KSize.getHeight(context, 40)),
      
                  /// Projects ---- See all
                 
                  const  KProjectSeeAll(),
                  SizedBox(height: KSize.getHeight(context, 20)),
      
                  /// IOS NATIVE CARD
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                    children: List.generate(3, (index) =>  const IosNativeCard()),
                  ),)
                 ,
      
                  SizedBox(height: KSize.getHeight(context, 40)),
      
                  /// New Events ---- See all
                  InkWell(
                    highlightColor: KColor.transparent,
                    splashColor: KColor.transparent,
                    hoverColor: KColor.transparent,
                    onTap: () => context.nextPage(const AllEventsScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Events',
                          style: KTextStyle.headline8,
                        ),
                        Text(
                          'See all',
                          style:
                              KTextStyle.caption.copyWith(color: KColor.primary),
                        ),
                      ],
                    ),
                  ),
      
                  SizedBox(height: KSize.getHeight(context, 20)),
      
                  ///  Events List
                  const EventListCard(),
      
                  SizedBox(
                      height: kBottomNavigationBarHeight +
                          KSize.getHeight(context, 20)),
                ],
              ),
            ),
          ),
      
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/global_widget/k_project_seeall.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/team/components/create_team_card.dart';
import 'package:flutter_app/view/screens/team/components/project_card.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/ios_native_card.dart';

// ignore: must_be_immutable
class MyTeamScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  MyTeamScreen({Key key});

  @override
  State<MyTeamScreen> createState() => _MyTeamScreenState();
}

class _MyTeamScreenState extends State<MyTeamScreen> {
  @override
  void initState() {
    appValueNotifier.hideBottomNavBar();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        onPressed: () {
          appValueNotifier.showBottomNavBar();
          context.nextReplacementPage(BottomNavigationScreen());
        },
        isCustomLeading: true,
        customTitle: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Transform.translate(
                offset: const Offset(-15, 0),
                child: Text(
                  'My Team',
                  style: KTextStyle.bodyText,
                ),
              ),
              const Spacer(),
              Transform.translate(
                offset: const Offset(0, 0),
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
                                borderRadius: BorderRadius.circular(24)),
                            //insetPadding: EdgeInsets.all(10),
                            child: const CreateTeamCard(),
                            //title: CreateTeamCard()
                          );
                        });
                  },
                  child: Image.asset('assets/images/add.png',
                      height: KSize.getHeight(context, 30),
                      width: KSize.getWidth(context, 30),
                      fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
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
              SizedBox(height: KSize.getHeight(context, 40)),
              Text('Marketing', style: KTextStyle.headline5),
              SizedBox(height: KSize.getHeight(context, 8)),
              Text('12 Members', style: KTextStyle.bodyText3),
              SizedBox(height: KSize.getHeight(context, 25)),

              /// Stack Image
              SizedBox(
                height: KSize.getHeight(context, 24),
                width: KSize.getWidth(context, 130),
                child: Stack(
                  children: [
                    Image.asset('assets/images/photo.png',
                        height: KSize.getHeight(context, 24),
                        width: KSize.getWidth(context, 24),
                        fit: BoxFit.fill),
                    Positioned(
                        left: 17,
                        child: Image.asset('assets/images/avatar3.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 35,
                        child: Image.asset('assets/images/blueMan.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 52,
                        child: Image.asset('assets/images/photo.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 68,
                        child: Image.asset('assets/images/blackMan.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 85,
                        child: Image.asset('assets/images/blue.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 40)),

              /// Projects ... See All
              const KProjectSeeAll(),
              SizedBox(height: KSize.getHeight(context, 20)),

              /// Project Card

              const ProjectCard(),

              SizedBox(height: KSize.getHeight(context, 50)),

              Text('Design', style: KTextStyle.headline5),
              SizedBox(height: KSize.getHeight(context, 12)),
              Text('12 Members', style: KTextStyle.bodyText3),
              SizedBox(height: KSize.getHeight(context, 25)),

              /// Stack Image
              SizedBox(
                height: KSize.getHeight(context, 24),
                width: KSize.getWidth(context, 130),
                child: Stack(
                  children: [
                    Image.asset('assets/images/photo.png',
                        height: KSize.getHeight(context, 24),
                        width: KSize.getWidth(context, 24),
                        fit: BoxFit.fill),
                    Positioned(
                        left: 17,
                        child: Image.asset('assets/images/avatar3.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 35,
                        child: Image.asset('assets/images/blueMan.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 52,
                        child: Image.asset('assets/images/photo.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 68,
                        child: Image.asset('assets/images/blackMan.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                    Positioned(
                        left: 85,
                        child: Image.asset('assets/images/blue.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill)),
                  ],
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 33)),
              const KProjectSeeAll(),
              SizedBox(height: KSize.getHeight(context, 20)),
              const IosNativeCard(),
              SizedBox(
                  height: kBottomNavigationBarHeight +
                      KSize.getHeight(context, 40)),
            ],
          ),
        ),
      ),
    );
  }
}

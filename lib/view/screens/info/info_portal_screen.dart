import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/info/components/current_projects_card.dart';
import 'package:flutter_app/view/screens/info/tabs/category_list_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class InfoPortalScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  InfoPortalScreen({Key key});

  @override
  State<InfoPortalScreen> createState() => _InfoPortalScreenState();
}

class _InfoPortalScreenState extends State<InfoPortalScreen> {
  @override
  void initState() {
    appValueNotifier.hideBottomNavBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: KAppBar(
            isCustomLeading: true,
            centerTitle: true,
            title: 'Info Portal',
            onPressed: () {
              appValueNotifier.showBottomNavBar();
              context.nextReplacementPage(BottomNavigationScreen());
            }),
        backgroundColor: KColor.white,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 10)),
          child: Column(
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),
              const CurrentProjectsCard(),
              SizedBox(height: KSize.getHeight(context, 25)),
              const Expanded(child: CategoryListScreen())
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}

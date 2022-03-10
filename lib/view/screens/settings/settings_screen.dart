import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/screens/auth/login_screen.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/notifications/notifications_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: KAppBar(
          automaticallyImplyLeading: false,
          isCustomLeading: false,
          centerTitle: true,
          title: 'Settings',
        ),
        backgroundColor: KColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),
              GestureDetector(
                  onTap: () {
                    context.nextPage(const NotificationsScreen());
                  },
                  child: Text('Notifications',
                      style: KTextStyle.subTitle1.copyWith(color: KColor.black))),
              SizedBox(height: KSize.getHeight(context, 40)),
              Text('Payment',
                  style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
              SizedBox(height: KSize.getHeight(context, 40)),
              Text('Connected Apps',
                  style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
              SizedBox(height: KSize.getHeight(context, 40)),
              Text('Safety',
                  style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
              SizedBox(height: KSize.getHeight(context, 40)),
              Text('Terms & Conditions',
                  style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  context.nextAndRemoveUntilPage(const LogInScreen());
                },
                child: Text('Log Out',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.red)),
              ),
              SizedBox(
                  height:
                      kBottomNavigationBarHeight + KSize.getHeight(context, 50)),
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

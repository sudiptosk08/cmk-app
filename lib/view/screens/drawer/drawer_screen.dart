
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/route/route_class_builder.dart';
import 'package:flutter_app/view/screens/auth/login_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerScreen extends StatefulWidget {
  final String title;

  const DrawerScreen({Key key, this.title}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: RouteClassBuilder.fromString('HomeScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Edit Profile', style: KTextStyle.bodyText2),
          page: RouteClassBuilder.fromString('EditProfileScreen'),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Employees ', style: KTextStyle.bodyText2),
          page: RouteClassBuilder.fromString('EmployeesScreen'),
        ),
        KFDrawerItem.initWithPage(
            text: Text('My Team', style: KTextStyle.bodyText2),
            page: RouteClassBuilder.fromString('MyTeamScreen')),
        KFDrawerItem.initWithPage(
            text: Text('Vacations', style: KTextStyle.bodyText2),
            page: RouteClassBuilder.fromString('VacationsScreen')),
        KFDrawerItem.initWithPage(
            text: Text('Info Portal', style: KTextStyle.bodyText2),
            page: RouteClassBuilder.fromString('InfoPortalScreen')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
          controller: _drawerController,
          header: KFDrawerItem(
              text: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('assets/images/profile.png',
                      alignment: Alignment.centerLeft,
                      height: KSize.getHeight(context, 50),
                      width: KSize.getWidth(context, 50),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 15)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('Mike Tyson',
                      style:
                          KTextStyle.headline5.copyWith(color: KColor.white))),
              SizedBox(height: KSize.getHeight(context, 10)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text('UI/UX Designer',
                    style:
                        KTextStyle.bodyText2.copyWith(color: KColor.whisper)),
              ),
            ],
          )),
          footer: KFDrawerItem(
            text: Text('Log Out',
                style: KTextStyle.bodyText2.copyWith(
                  decoration: TextDecoration.underline,
                )),
            onPressed: () {
              context.nextAndRemoveUntilPage(const LogInScreen());
            },
          ),
          decoration: const BoxDecoration(color: KColor.primary)),
    );
  }
}

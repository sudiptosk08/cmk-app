import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/vacations/tabs/add_vacation_dialog_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class VacationsScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  VacationsScreen({Key key});

  @override
  State<VacationsScreen> createState() => _VacationsScreenState();
}

class _VacationsScreenState extends State<VacationsScreen> {
  String _chosenValue = 'May,2021';

  final List<String> profileImgList = [
    'assets/images/photo.png',
    'assets/images/photoImg2.png',
    'assets/images/avatar5.png',
  ];
  final List<String> profileNameList = [
    'Sami Ahmed',
    'Mahdi Ahmed',
    'Tony Stark'
  ];

  final List<String> profileEmailList = [
    'sami@gmail.com',
    'mahdi@gmail.com',
    'tony@gmail.com',
  ];
  final List<String> daysList = [
    '4 Days',
    '7 Days',
    '7 Days',
  ];
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
          onPressed: () {
            appValueNotifier.showBottomNavBar();
            context.nextReplacementPage(BottomNavigationScreen());
          },
          isCustomLeading: true,
          centerTitle: true,
          title: 'Vacations',
        ),
        backgroundColor: KColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 25)),

              /// Drop Down Button
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      focusColor: Colors.white,
                      value: _chosenValue,
                      icon: Image.asset(
                        'assets/images/down.png',
                        height: KSize.getHeight(context, 7),
                        width: KSize.getWidth(context, 8.4),
                        fit: BoxFit.fill,
                      ),
                      items: <String>[
                        'May,2021',
                        'May,2022',
                        'July,2021',
                        'Feb,2021',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: KTextStyle.headline8));
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    )),

                    /// Add Image
                    InkWell(
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
                                  child: const AddVacationDialogScreen());
                            });
                      },
                      child: Image.asset(
                        'assets/images/add.png',
                        height: KSize.getHeight(context, 30),
                        width: KSize.getWidth(context, 30),
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: KSize.getHeight(context, 15)),

              /// Divider
              const Divider(
                color: KColor.whiteSmoke,
                thickness: 2,
              ),

              SizedBox(height: KSize.getHeight(context, 15)),

              /// List
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: profileImgList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: KSize.getHeight(context, 30)),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: KSize.getWidth(context, 24)),
                          height: KSize.getHeight(context, 192),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: KColor.white,
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
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: KSize.getWidth(context, 15),
                              right: KSize.getWidth(context, 14),
                              top: KSize.getHeight(context, 23),
                              bottom: KSize.getHeight(context, 30),
                            ),
                            child: Column(
                              children: [
                                /// Image/ Text
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      profileImgList[index],
                                      height: KSize.getHeight(context, 50),
                                      width: KSize.getWidth(context, 50),
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                        width: KSize.getWidth(context, 16)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profileNameList[index],
                                          style: KTextStyle.bodyText,
                                        ),
                                        Text(profileEmailList[index],
                                            style: KTextStyle.bodyText2
                                                .copyWith(color: KColor.grey)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        'assets/images/more2.png',
                                        height: KSize.getHeight(context, 18),
                                        width: KSize.getWidth(context, 4),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: KSize.getWidth(context, 35),
                                    right: KSize.getWidth(context, 41),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Work From Home',
                                              style: KTextStyle.caption),
                                          SizedBox(
                                            height:
                                                KSize.getHeight(context, 10),
                                          ),
                                          Text(daysList[index],
                                              style: KTextStyle.subTitle1
                                                  .copyWith(
                                                      color: KColor.black)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Vacations',
                                              style: KTextStyle.caption),
                                          SizedBox(
                                            height:
                                                KSize.getHeight(context, 10),
                                          ),
                                          Text('02 Days',
                                              style: KTextStyle.subTitle1
                                                  .copyWith(
                                                      color: KColor.black)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
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

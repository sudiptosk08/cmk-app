import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/drawer/drawer_screen.dart';
import 'package:flutter_app/view/screens/message/message_chat_list_screen.dart';
import 'package:flutter_app/view/screens/settings/settings_screen.dart';
import 'package:flutter_app/view/screens/team/create_team_screen.dart';
import 'package:flutter_app/view/search/search_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class BottomNavigationScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  BottomNavigationScreen({Key key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedItemIndex = 0;

  int _currentIndex = 0;

  final List<Widget> _bottomNavPages = [
    const DrawerScreen(),
    const MessageChatListScreen(),
    const CreateTeamScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_currentIndex],
      //backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: appValueNotifier.navBarStateNotifier,
          builder: (context, value, child) {
            return SizedBox(
              height: value ? 0 : KSize.getHeight(context, 84),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: KColor.whiteSmoke,
                              blurRadius: 10,
                              offset: Offset(0, 0)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildNavBarItem(
                            'assets/images/nav1.png', 0, true, 'Home'),
                        Padding(
                          padding: EdgeInsets.only(
                              right: KSize.getWidth(context, 0)),
                          child: buildNavBarItem(
                              'assets/images/nav2.png', 1, false, 'Messages'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: KSize.getWidth(context, 30)),
                          child: buildNavBarItem(
                              'assets/images/nav3.png', 3, false, 'Search'),
                        ),
                        buildNavBarItem(
                            'assets/images/nav4.png', 4, false, 'Settings')
                      ],
                    ),
                  ),
                  if (!value)
                    Positioned(
                      bottom: KSize.getWidth(context, 50),
                      left: context.screenWidth / 2 -
                          KSize.getWidth(context, 62) / 2,
                      child: InkWell(
                        onTap: () {
                          context.nextPage(const CreateTeamScreen());
                        },
                        child: Container(
                            height: KSize.getHeight(context, 55),
                            width: KSize.getWidth(context, 55),
                            decoration: const BoxDecoration(
                              color: KColor.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffe0edff),
                                    offset: Offset(0.0, 5.0),
                                    spreadRadius: 2,
                                    blurRadius: 4),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: KColor.white,
                            )),
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildNavBarItem(String image, int index, bool isActive, String text) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(
              top: KSize.getHeight(context, 22),
              bottom: KSize.getHeight(context, 20),
            ),
            child: Image.asset(image,
                height: KSize.getHeight(context, 20),
                width: KSize.getWidth(context, 20),
                color:
                    index == _selectedItemIndex ? KColor.black : KColor.grey),
          ),
          Text(
            text,
            style: KTextStyle.caption.copyWith(
                height: 1,
                color:
                    _selectedItemIndex == index ? KColor.black : KColor.grey),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

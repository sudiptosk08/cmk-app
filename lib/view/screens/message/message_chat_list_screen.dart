// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/message/components/group_list.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageChatListScreen extends StatefulWidget {
  const MessageChatListScreen({Key key}) : super(key: key);

  @override
  State<MessageChatListScreen> createState() => _MessageChatListScreenState();
}

class _MessageChatListScreenState extends State<MessageChatListScreen> {
  int secondaryIndex = 0;
  int primaryIndex = 0;

  void changeIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  void changePrimaryIndex(int index) {
    setState(() {
      primaryIndex = index;
    });
  }

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final List<String> imageList = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
  ];
  final List<String> titleList = [
    'Rozanne Barrientes',
    'Mahdi Ahmed',
    'Sayem Ahmed',
    'Arif mahmud',
    'Tony Stark',
    'Steve Matno'
  ];
  final List<String> subTitleList = [
    'A wonderful serenity has taken...',
    'What about Paypal',
    'we should move forword to talk with....',
    'Let\'s have a call for a future projects',
    'I don\'t think i can fit on his ui',
    'A wonderful serenity has taken...'
  ];
 final List<Map<String, dynamic>> groupList = [
     {
        'imagePath': "assets/images/eclipse2.png",
        'teamName': "Team Loop",
        'teamMember': "10 Members",
        'titleTxt': "Sayem sent a Massage",
        'time': "15 min Ago",
    },
    {
        'imagePath': "assets/images/ellipse1.png",
        'teamName': "Team Align",
        'teamMember': "6 Members",
        'titleTxt': "Sami Rafi Sent a Attachment",
        'time': "10 min Ago",
    },
    
  ];
  @override
  Widget build(BuildContext context) {
   
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: KColor.white,
        appBar: KAppBar(
          automaticallyImplyLeading: false,
          isCustomLeading: false,
          customTitle: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Transform.translate(
                  offset: const Offset(15, 0),
                  child: Text(
                    'Chat List',
                    style: KTextStyle.bodyText,
                  ),
                ),
                const Spacer(),
                Image.asset('assets/images/profile.png',
                    height: KSize.getHeight(context, 36),
                    width: KSize.getWidth(context, 36),
                    fit: BoxFit.contain),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getHeight(context, 40)),

            /// Conversations ,,,,, Search Icon,,, Add Icon
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Row(
                children: [
                  Text('Conversations', style: KTextStyle.headline8),
                  const Spacer(),
                  Image.asset(
                    'assets/images/search.png',
                    height: KSize.getHeight(context, 20),
                    width: KSize.getWidth(context, 20),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: KSize.getWidth(context, 25.5)),
                  Image.asset(
                    'assets/images/add.png',
                    height: KSize.getHeight(context, 30),
                    width: KSize.getWidth(context, 30),
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 18)),

            /// Groups List
            GestureDetector(
              onTap: () {
                setState(() {
                  if (secondaryIndex == 0) {
                    secondaryIndex = -1;
                  } else {
                    setState(() {
                      secondaryIndex = 0;
                    });
                  }
                });
              },
              child: Column(
                children: [
                  Divider(
                    color: secondaryIndex == 0
                        ? KColor.whiteSmoke
                        : KColor.transparent,
                        thickness: 1,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        if (secondaryIndex == 0) {
                          secondaryIndex = -1;
                        } else {
                          setState(() {
                            secondaryIndex = 0;
                          });
                        }
                      });
                    },
                    child: Container(                    
                      decoration: const BoxDecoration(
                        color: KColor.white,
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 24),
                          vertical: secondaryIndex == 0
                              ? KSize.getHeight(context, 25)
                              : 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              /// Arrow Icon
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (secondaryIndex == 0) {
                                      secondaryIndex = -1;
                                    } else {
                                      setState(() {
                                        secondaryIndex = 0;
                                      });
                                    }
                                  });
                                },
                                child: Icon(
                                  secondaryIndex == 0
                                      ?Icons.keyboard_arrow_down
                                      :Icons.keyboard_arrow_up,
                                  color: KColor.primary,
                                ),
                              ),
                              SizedBox(
                                width: KSize.getWidth(context, 9),
                              ),

                              /// Groups Text
                              Text('Groups',
                                  style: KTextStyle.bodyText2
                                      .copyWith(color: KColor.primary))
                            ],
                          ),
                          if (secondaryIndex == 0)
                            SizedBox(height: KSize.getHeight(context, 7)),
                          if (secondaryIndex == 0)
                          ...List.generate(groupList.length, (index) => GroupList(
                            imagePath: groupList[index]['imagePath'],
                            teamName: groupList[index]['teamName'],
                            teamMember:groupList[index]['teamMember'],
                            titleTxt: groupList[index]['titleTxt'],
                            time: groupList[index]['time'],
                          )),
                            
                          // if (secondaryIndex == 0) const Spacer(),
                          // if (secondaryIndex == 0)

                            /// Team Loop
                            // GestureDetector(
                            //   onTap: (){
                            //     context.nextPage(const MessageGroupScreen());
                            //   },
                            //   child: Row(
                            //     children: [
                            //       Image.asset(
                            //         'assets/images/eclipse2.png',
                            //         height: KSize.getHeight(context, 40),
                            //         width: KSize.getWidth(context, 40),
                            //         fit: BoxFit.fill,
                            //       ),
                            //       SizedBox(width: KSize.getWidth(context, 15)),
                            //       Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           /// Team Loop
                            //           RichText(
                            //               text: TextSpan(children: [
                            //             TextSpan(
                            //                 text: 'Team Loop',
                            //                 style: KTextStyle.bodyText),
                            //             TextSpan(
                            //                 text: ' (10 Members)',
                            //                 style: KTextStyle.overLine),
                            //           ])),
                            //           SizedBox(
                            //             height: KSize.getHeight(context, 5),
                            //           ),
                            //           Text(
                            //             'Sayem Sent a Massage',
                            //             style: KTextStyle.caption,
                            //           )
                            //         ],
                            //       ),
                            //       const Spacer(),
                            //       Text('15min Ago',
                            //           style: KTextStyle.overLine
                            //               .copyWith(color: KColor.grey))
                            //     ],
                            //   ),
                            // ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: secondaryIndex == 0
                        ? KColor.whiteSmoke
                        : KColor.transparent,
                        thickness: 1,
                  ),
                ],
              ),
            ),

            SizedBox(height: KSize.getHeight(context, 18)),


            /// Direct Message

            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 24)),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          
                          setState(() {
                            if (primaryIndex == index) {
                              primaryIndex = -1;
                            } else {
                              setState(() {
                                primaryIndex = index;
                              });
                            }
                          });
                        },
                        child: Column(
                          children: [
                            /// Arrow Icon /// Direct Message
                            if (index == 0)
                              Row(
                                children: [
                                  /// Arrow Icon

                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (primaryIndex == index) {
                                          primaryIndex = -1;
                                        } else {
                                          setState(() {
                                            primaryIndex = index;
                                          });
                                        }
                                      });
                                    },
                                    child: Icon(
                                      primaryIndex == index
                                          ? Icons.keyboard_arrow_down
                                          :Icons.keyboard_arrow_up ,
                                      color: KColor.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: KSize.getWidth(context, 9),
                                  ),

                                  /// Direct Message
                                  Text('Direct Message',
                                      style: KTextStyle.bodyText2
                                          .copyWith(color: KColor.primary))
                                ],
                              ),
                            SizedBox(height: KSize.getHeight(context, 20)),

                            if (primaryIndex == index)
                              GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          
                          setState(() {
                            if (primaryIndex == index) {
                              primaryIndex = -1;
                            } else {
                              setState(() {
                                primaryIndex = index;
                              });
                            }
                          });
                        },
                        child: Column(
                                  children: List.generate(
                                    imageList.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: KSize.getHeight(context, 25)),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            imageList[index],
                                            height: KSize.getHeight(context, 40),
                                            width: KSize.getWidth(context, 40),
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                              width: KSize.getWidth(context, 15)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(titleList[index],
                                                  style: KTextStyle.bodyText),
                                              SizedBox(
                                                height:
                                                    KSize.getHeight(context, 7),
                                              ),
                                              Text(subTitleList[index],
                                                  style: KTextStyle.caption),
                                            ],
                                          ),
                                          const Spacer(),
                                          if (index == 0 || index == 1)
                                            Image.asset(
                                              'assets/images/notification2.png',
                                              height:
                                                  KSize.getHeight(context, 25),
                                              width: KSize.getWidth(context, 24),
                                              fit: BoxFit.fill,
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}

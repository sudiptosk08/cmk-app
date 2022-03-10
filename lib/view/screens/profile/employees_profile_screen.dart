import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesProfileScreen extends StatefulWidget {
  const EmployeesProfileScreen({Key key}) : super(key: key);

  @override
  State<EmployeesProfileScreen> createState() => _EmployeesProfileScreenState();
}

class _EmployeesProfileScreenState extends State<EmployeesProfileScreen> {
  final List<String> titleList = [
    'IOS NATIVE',
    'Web App',
    'Website',
    'Project',
  ];
  final List<String> subTitleList = [
    'E-Commerce App Ui',
    'Banking Web App Ux',
    'Food Landing Page....',
    'Behance Project'
  ];

  final List<String> imageList = [
    'assets/images/Image.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: KAppBar(
          onPressed: (){
           Navigator.of(context).pop();
          },
          isCustomLeading: true,
          centerTitle: true,
          title: 'Employees Profile',
        ),
        backgroundColor: KColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 54)),

              /// Profile image
              Center(
                child: Image.asset(
                  'assets/images/photo.png',
                  height: KSize.getHeight(context, 60),
                  width: KSize.getWidth(context, 60),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 10)),

              /// Name
              Center(child: Text('Sami Ahmed', style: KTextStyle.headline5)),
              SizedBox(height: KSize.getHeight(context, 10)),

              /// UI/UX Designer
              Center(
                child: Text('UI/UX Designer',
                    style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),
              ),

              SizedBox(height: KSize.getHeight(context, 35)),

              /// Completed / OnTask / On Review
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Completed', style: KTextStyle.caption),
                      SizedBox(height: KSize.getHeight(context, 10)),
                      Text('10',
                          style:
                              KTextStyle.subTitle1.copyWith(color: KColor.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('On Task', style: KTextStyle.caption),
                      SizedBox(height: KSize.getHeight(context, 10)),
                      Text('25',
                          style:
                              KTextStyle.subTitle1.copyWith(color: KColor.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('On Review', style: KTextStyle.caption),
                      SizedBox(height: KSize.getHeight(context, 10)),
                      Text('0',
                          style:
                              KTextStyle.subTitle1.copyWith(color: KColor.black)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: KSize.getHeight(context, 35)),

              /// Current Task
              Text('Current Task', style: KTextStyle.headline8),

              SizedBox(height: KSize.getHeight(context, 20)),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: KSize.getHeight(context, 20)),
                        child: Container(
                          height: KSize.getHeight(context, 141),
                          decoration: BoxDecoration(
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
                              color: KColor.white,
                              borderRadius: BorderRadius.circular(12)),
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
                          Text(titleList[index],
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.grey,height: 1.5)),
                         
                          Text(subTitleList[index],
                              style: KTextStyle.headline8.copyWith(fontSize: 18,height: 1.2)),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: KSize.getWidth(context, 20)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/calendar.png',
                                      height: KSize.getHeight(context, 20),
                                      width: KSize.getWidth(context, 18),
                                      fit: BoxFit.fill,
                                      color: KColor.grey,
                                    ),
                                    SizedBox(
                                        width: KSize.getWidth(context, 9.98)),
                                    Text(
                                      'Created May 24,2021',
                                      style: KTextStyle.caption
                                          .copyWith(fontSize: 13),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: KSize.getHeight(context, 24),
                                      width: KSize.getWidth(context, 87),
                                      child: Stack(
                                        children: [
                                          Image.asset('assets/images/photo.png',
                                              height:
                                                  KSize.getHeight(context, 24),
                                              width: KSize.getWidth(context, 24),
                                              fit: BoxFit.fill),
                                          Positioned(
                                              left: 17,
                                              child: Image.asset(
                                                  'assets/images/photo2.png',
                                                  height: KSize.getHeight(
                                                      context, 24),
                                                  width:
                                                      KSize.getWidth(context, 24),
                                                  fit: BoxFit.fill)),
                                          Positioned(
                                              left: 35,
                                              child: Image.asset(
                                                  'assets/images/photo3.png',
                                                  height: KSize.getHeight(
                                                      context, 24),
                                                  width:
                                                      KSize.getWidth(context, 24),
                                                  fit: BoxFit.fill)),
                                          Positioned(
                                              left: 52,
                                              child: Image.asset(
                                                  'assets/images/blue.png',
                                                  height: KSize.getHeight(
                                                      context, 24),
                                                  width:
                                                      KSize.getWidth(context, 24),
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
                    }),
              ),
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

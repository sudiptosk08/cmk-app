import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class AllProjectsListScreen extends StatefulWidget {
  const AllProjectsListScreen({Key key}) : super(key: key);

  @override
  _AllProjectsListScreenState createState() => _AllProjectsListScreenState();
}

class _AllProjectsListScreenState extends State<AllProjectsListScreen> {

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
    return Expanded(
      child: ListView.builder(
          itemCount: titleList.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
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
                  margin: EdgeInsets.only(
                      left: KSize.getWidth(context, 24),
                      right: KSize.getWidth(context, 31)),
                  child: Column(
                    children: [
                      const Spacer(),

                      /// Image/ IOS NATIVE/ E COMMERCE APP UI
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 20)),
                        child: SizedBox(
                          height: KSize.getHeight(context, 60),
                          child: Row(
                            children: [
                              /// Category Image List
                              Image.asset(imageList[index],
                                  height: KSize.getHeight(context, 48),
                                  width: KSize.getWidth(context, 48),
                                  fit: BoxFit.contain),
                              SizedBox(width: KSize.getWidth(context, 19)),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(titleList[index],
                                      style: KTextStyle.bodyText2.copyWith(
                                          color: KColor.grey, height: 1.5)),
                                  const Spacer(),
                                  Text(subTitleList[index],
                                      style: KTextStyle.headline8
                                          .copyWith(fontSize: 18)),
                                ],
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
                            SizedBox(width: KSize.getWidth(context, 9.98)),
                            Text(
                              'Created May 24,2021',
                              style:
                              KTextStyle.caption.copyWith(fontSize: 13),
                            ),
                            const Spacer(),
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
                                      child: Image.asset(
                                          'assets/images/photo2.png',
                                          height:
                                          KSize.getHeight(context, 24),
                                          width:
                                          KSize.getWidth(context, 24),
                                          fit: BoxFit.fill)),
                                  Positioned(
                                      left: 35,
                                      child: Image.asset(
                                          'assets/images/photo3.png',
                                          height:
                                          KSize.getHeight(context, 24),
                                          width:
                                          KSize.getWidth(context, 24),
                                          fit: BoxFit.fill)),
                                  Positioned(
                                      left: 52,
                                      child: Image.asset(
                                          'assets/images/blue.png',
                                          height:
                                          KSize.getHeight(context, 24),
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
              ),
            );
          }),
    );
  }
}

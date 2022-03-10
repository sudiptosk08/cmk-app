import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

// ignore: unused_import
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key key}) : super(key: key);

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final List<String> titleList = [
    'Home Screen.png',
    'details Screen.png',
  ];
  final List<String> subTitleList = [
    '6 MB PNG',
    '10 MB PNG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        title: 'Project Details',
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 41)),
              SizedBox(
                height: KSize.getHeight(context, 51),
                child: SizedBox(
                  height: KSize.getHeight(context, 60),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Image.png',
                          height: KSize.getHeight(context, 48),
                          width: KSize.getWidth(context, 48),
                          fit: BoxFit.contain),
                      SizedBox(width: KSize.getWidth(context, 20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('IOS NATIVE',
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.grey, height: 1.3)),
                          const Spacer(),
                          Text('E-Commerce App Ui',
                              style: KTextStyle.headline8
                                  .copyWith(fontSize: 18, height: 1.2)),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        /// Show Share Dialog
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                child: SizedBox(
                                  height: KSize.getHeight(context, 350),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 15)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  KSize.getWidth(context, 24)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Share the Folder',
                                                  style: KTextStyle.headline8
                                                      .copyWith(fontSize: 18)),
                                              Transform.translate(
                                                offset: const Offset(15, 0),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.close,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 30)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  KSize.getWidth(context, 24)),
                                          child: Text(
                                            'Team Member',
                                            style: KTextStyle.caption,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 5)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  KSize.getWidth(context, 24)),
                                          child: const KTextField(
                                            hintText: 'Enter Email',
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 23)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  KSize.getWidth(context, 24)),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.add,
                                                  color: KColor.primary),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 11)),
                                              Text(
                                                'Add another Member',
                                                style: KTextStyle.subTitle1
                                                    .copyWith(
                                                        color: KColor.primary),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 26)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: KSize.getWidth(context, 11),
                                            right: KSize.getWidth(context, 14),
                                          ),
                                          child:
                                              const KButton(buttonText: 'Add'),
                                        ),
                                        SizedBox(
                                            height:
                                                KSize.getHeight(context, 24)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/images/share.png',
                          height: KSize.getHeight(context, 24),
                          width: KSize.getWidth(context, 24),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 40)),

              /// Description
              Text('Descriptions',
                  style: KTextStyle.button.copyWith(color: KColor.black)),
              SizedBox(height: KSize.getHeight(context, 12)),

              /// Description Long Text
              Text(
                'An ecommerce mobile app should aim at providing an immersive and unique experience that makes online shopping a much simpler and seamless process.',
                style: KTextStyle.bodyText2
                    .copyWith(color: KColor.grey, height: 1.9),
              ),
              SizedBox(height: KSize.getHeight(context, 40)),

              /// Reporter/ Assignees
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reporter',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/photo.png',
                            height: KSize.getHeight(context, 24),
                            width: KSize.getWidth(context, 24),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: KSize.getWidth(context, 12)),
                          Text('Sami Rafi',
                              style: KTextStyle.subTitle1
                                  .copyWith(color: KColor.black))
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assignees',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
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
                                child: Image.asset('assets/images/photo2.png',
                                    height: KSize.getHeight(context, 24),
                                    width: KSize.getWidth(context, 24),
                                    fit: BoxFit.fill)),
                            Positioned(
                                left: 35,
                                child: Image.asset('assets/images/photo3.png',
                                    height: KSize.getHeight(context, 24),
                                    width: KSize.getWidth(context, 24),
                                    fit: BoxFit.fill)),
                            Positioned(
                                left: 52,
                                child: Image.asset('assets/images/blue.png',
                                    height: KSize.getHeight(context, 24),
                                    width: KSize.getWidth(context, 24),
                                    fit: BoxFit.fill)),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: KSize.getHeight(context, 40)),

              /// Dead Line / Created
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dead Line',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey,height: 1.5),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
                      Text('Jun 03, 2021',
                          style: KTextStyle.subTitle1
                              .copyWith(color: KColor.black,height: 1.2))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Created',
                        style:
                            KTextStyle.bodyText2.copyWith(color: KColor.grey,height: 1.5),
                      ),
                      SizedBox(height: KSize.getHeight(context, 12)),
                      Text('May 24, 2021',
                          style: KTextStyle.subTitle1
                              .copyWith(color: KColor.black,height: 1.2))
                    ],
                  ),
                ],
              ),

              SizedBox(height: KSize.getHeight(context, 40)),

              /// Task Attachments
              Text('Task Attachments (3)',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),
              SizedBox(height: KSize.getHeight(context, 20)),

              /// Task Attachments List
              SizedBox(
                height: KSize.getHeight(context, 260),
                child: ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 0.2,
                          margin: EdgeInsets.only(
                              bottom: KSize.getHeight(context, 20)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: KSize.getHeight(context, 0)),
                            height: KSize.getHeight(context, 70),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: KColor.whiteSmoke, width: 0.5),
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 15),
                                  vertical: KSize.getHeight(context, 13)),
                              child: Row(
                                children: [
                                  if (index != 2)
                                    Image.asset(
                                      'assets/images/attachments.png',
                                      height: KSize.getHeight(context, 44),
                                      width: KSize.getWidth(context, 44),
                                      fit: BoxFit.fill,
                                    ),
                                  if (index != 2)
                                    SizedBox(
                                        width: KSize.getWidth(context, 15)),
                                  if (index != 2)
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          titleList[index],
                                          style: KTextStyle.button.copyWith(
                                              color: KColor.black, height: 1),
                                        ),
                                        const Spacer(),
                                        Text(
                                          subTitleList[index],
                                          style: KTextStyle.caption
                                              .copyWith(height: 1),
                                        )
                                      ],
                                    ),
                                  if (index != 2) const Spacer(),
                                  if (index != 2)
                                    Image.asset(
                                      'assets/images/more.png',
                                      height: KSize.getHeight(context, 44),
                                      width: KSize.getWidth(context, 44),
                                      fit: BoxFit.fill,
                                    ),
                                  if (index == 2) const Spacer(),
                                  if (index == 2)
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/attach.png',
                                          height: KSize.getHeight(context, 16),
                                          width: KSize.getWidth(context, 16),
                                          fit: BoxFit.fill,
                                        ),
                                        const Spacer(),
                                        Text('Add Your PNG',
                                            style: KTextStyle.caption
                                                .copyWith(height: 1))
                                      ],
                                    ),
                                  if (index == 2) const Spacer(),
                                ],
                              ),
                            ),
                          ));
                    }),
              ),

              SizedBox(height: KSize.getHeight(context, 22)),
            ],
          ),
        ),
      ),
    );
  }
}

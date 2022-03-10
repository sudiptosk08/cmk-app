import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/global_widget/calendar_dialog_screen.dart';
import 'package:flutter_app/view/screens/project/components/all_projects_list_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class AllProjectsScreen extends StatefulWidget {
  const AllProjectsScreen({Key key}) : super(key: key);

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
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
    return Scaffold(
      appBar: KAppBar(
        onPressed: () {
          Navigator.of(context).pop();
        },
        automaticallyImplyLeading: true,
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
                  'All Projects',
                  style: KTextStyle.bodyText,
                ),
              ),
              const Spacer(),
              Transform.translate(
                offset: const Offset(0, 0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: const CalendarDialogScreen());
                        });
                  },
                  child: Image.asset('assets/images/calendar.png',
                      height: KSize.getHeight(context, 16.53),
                      width: KSize.getWidth(context, 16.08),
                      fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: KColor.white,
      body: Column(
        children: [
          SizedBox(height: KSize.getHeight(context, 41)),

          /// Project List
          const AllProjectsListScreen()
        ],
      ),
    );
  }
}

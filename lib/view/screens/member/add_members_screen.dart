import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({Key key}) : super(key: key);

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: KColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 50)),
                  Center(
                      child: Image.asset('assets/images/logo.png',
                          height: KSize.getHeight(context, 74),
                          width: KSize.getWidth(context, 55),
                          fit: BoxFit.fill)),
                  SizedBox(height: KSize.getHeight(context, 100)),
                  Center(child: Text('Add Member', style: KTextStyle.headline6)),
                  SizedBox(height: KSize.getHeight(context, 50)),

                  /// Team Member
                  Text('Team Member', style: KTextStyle.caption),
                  SizedBox(height: KSize.getHeight(context, 20)),

                  /// Email TextField
                  const KTextField(hintText: 'Enter Email'),
                  SizedBox(height: KSize.getHeight(context, 50)),

                  /// Add Button
                  KButton(
                    buttonText: 'Add',
                    onPressed: () => moveToLastScreen(),
                  ),

                  SizedBox(height: KSize.getHeight(context, 333)),
                ],
              ),
            ),
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

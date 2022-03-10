import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/profile/components/edit_textfield_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

// ignore: must_be_immutable
class EditProfileScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  EditProfileScreen({Key key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    appValueNotifier.hideBottomNavBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
          isCustomLeading: true,
          centerTitle: true,
          title: 'Edit Profile',
          onPressed: () {
            appValueNotifier.showBottomNavBar();
            Navigator.pop(context);
          }),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: KSize.getWidth(context, 24),
              right: KSize.getWidth(context, 41)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.getHeight(context, 44)),
              Center(
                child: Image.asset(
                  'assets/images/profile.png',
                  height: KSize.getHeight(context, 65),
                  width: KSize.getWidth(context, 60),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: KSize.getHeight(context, 10)),
              Center(child: Text('Mike Tyson', style: KTextStyle.headline5)),
              SizedBox(height: KSize.getHeight(context, 5)),
              Center(
                child: Text('UI/UX Designer',
                    style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),
              ),
              SizedBox(height: KSize.getHeight(context, 30)),

              /// Name Text
              Text('Name',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),

              /// Name TextField
              const EditTextFieldScreen(
                  hintText: 'Enter Name', type: TextInputType.text),

              SizedBox(height: KSize.getHeight(context, 20)),

              /// Email Text
              Text('Email',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),

              /// Email TextField
              const EditTextFieldScreen(
                  hintText: 'Enter Email', type: TextInputType.emailAddress),

              SizedBox(height: KSize.getHeight(context, 20)),

              /// Phone Text
              Text('Phone',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),

              /// Phone TextField
              const EditTextFieldScreen(
                  hintText: 'Enter Phone', type: TextInputType.number),

              SizedBox(height: KSize.getHeight(context, 20)),

              /// Position Text
              Text('Position',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),

              /// Position TextField
              const EditTextFieldScreen(
                  hintText: 'Enter Position', type: TextInputType.number),

              SizedBox(height: KSize.getHeight(context, 20)),

              /// Skype Text
              Text('Skype',
                  style: KTextStyle.bodyText2.copyWith(color: KColor.grey)),

              /// Skype TextField
              const EditTextFieldScreen(
                  hintText: 'Enter Skype Id', type: TextInputType.number),

              SizedBox(
                  height: kBottomNavigationBarHeight +
                      KSize.getHeight(context, 46)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/screens/auth/signup_screen.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin:
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
                Center(
                    child: Text('Log In To Woorkroom',
                        style: KTextStyle.headline6)),
                SizedBox(height: KSize.getHeight(context, 40)),
                Text('Your Email', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 15)),
                const KTextField(hintText: 'Email'),
                SizedBox(height: KSize.getHeight(context, 35)),
                Text('Password', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 15)),
                const KTextField(hintText: 'Password', isPasswordField: true),
                SizedBox(height: KSize.getHeight(context, 15)),
                Align(
                    alignment: Alignment.topRight,
                    child: Text('Forgot Password', style: KTextStyle.caption)),
                SizedBox(height: KSize.getHeight(context, 38)),
                KButton(
                  buttonText: 'Log In',
                  onPressed: () {
                    context.nextPage(BottomNavigationScreen());
                  },
                ),
                SizedBox(height: KSize.getHeight(context, 30)),
                GestureDetector(
                  onTap: () {
                    context.nextPage(const SignUpScreen());
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'New User?', style: KTextStyle.caption),
                      TextSpan(
                          text: ' Create Account',
                          style: KTextStyle.caption
                              .copyWith(color: KColor.primary)),
                    ])),
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 190)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

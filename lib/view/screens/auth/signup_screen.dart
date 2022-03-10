import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/screens/auth/login_screen.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownValue = '+1';

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
                    child: Text('Sign Up To Workroom',
                        style: KTextStyle.headline6)),
                SizedBox(height: KSize.getHeight(context, 50)),
                Text('Phone Number', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 15)),
                Row(
                  children: [
                    /// Drop Down
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: KSize.getHeight(context, 50),
                        width: KSize.getWidth(context, 74),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: KColor.whiteSmoke)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: KSize.getHeight(context, 11),
                              horizontal: KSize.getWidth(context, 10)),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: KColor.grey, size: 20),
                            focusColor: Colors.white,
                            value: dropdownValue,
                            style: const TextStyle(color: Colors.white),
                            items: <String>[
                              '+1',
                              '+2',
                              '+3',
                              '+4',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: KTextStyle.button),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                dropdownValue = value;
                              });
                            },
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: KSize.getWidth(context, 16)),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: KSize.getHeight(context, 50),
                        child: Center(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: '345 567-23-56',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: KColor.whiteSmoke)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: KColor.whiteSmoke)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: KSize.getHeight(context, 12),
                                    horizontal: KSize.getWidth(context, 18))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 35)),

                /// Code Text
                Text('Code', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 16)),

                /// Pin Code
                PinCodeFields(
                  length: 4,
                  fieldBorderStyle: FieldBorderStyle.Square,
                  responsive: false,
                  fieldHeight: KSize.getHeight(context, 62),
                  fieldWidth: KSize.getWidth(context, 62),
                  borderWidth: 1.0,
                  activeBorderColor: KColor.primary,
                  borderRadius: BorderRadius.circular(15.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: true,
                  borderColor: KColor.whiteSmoke,
                  fieldBackgroundColor: KColor.white,
                  margin: const EdgeInsets.only(right: 8),
                  textStyle: KTextStyle.button.copyWith(color: KColor.deepBlue),
                  onComplete: (output) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BottomNavigationScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: KSize.getHeight(context, 35)),

                /// Your Name
                Text('Your Name', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 20)),

                /// Name TextField
                const KTextField(hintText: 'Name'),
                SizedBox(height: KSize.getHeight(context, 35)),

                /// Your Email
                Text('Your Email', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 20)),

                /// Email TextField
                const KTextField(hintText: 'Email'),

                SizedBox(height: KSize.getHeight(context, 35)),

                /// Your Password
                Text('Password', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 20)),

                /// Password TextField
                const KTextField(hintText: 'Password', isPasswordField: true),

                SizedBox(height: KSize.getHeight(context, 35)),

                /// Confirm Password
                Text('Confirm Password', style: KTextStyle.caption),
                SizedBox(height: KSize.getHeight(context, 20)),

                /// Confirm Password TextField
                const KTextField(
                  hintText: 'Confirm Password',
                  isPasswordField: true,
                ),

                SizedBox(height: KSize.getHeight(context, 40)),
                KButton(
                  buttonText: 'Next',
                  onPressed: () {
                    context.nextReplacementPage(BottomNavigationScreen());
                  },
                ),
                SizedBox(height: KSize.getHeight(context, 30)),
                GestureDetector(
                  onTap: () {
                    context.nextReplacementPage(const LogInScreen());
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Have Account?', style: KTextStyle.caption),
                      TextSpan(
                          text: ' Log In',
                          style: KTextStyle.caption.copyWith(
                              color: KColor.primary,
                              fontWeight: FontWeight.w500)),
                    ])),
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 58)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

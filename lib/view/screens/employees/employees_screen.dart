import 'package:flutter/material.dart';
import 'package:flutter_app/custom_plugin/kf_drawer.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/employees/tabs/employee_list_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/add_employees_dialog_card.dart';

// ignore: must_be_immutable
class EmployeesScreen extends KFDrawerContent {
  // ignore: use_key_in_widget_constructors
  EmployeesScreen({Key key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  @override
  void initState() {
    appValueNotifier.hideBottomNavBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: KAppBar(
          onPressed: () {
            appValueNotifier.showBottomNavBar();
             context.nextReplacementPage(BottomNavigationScreen());
          },
          isCustomLeading: true,
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
                    'Employees',
                    style: KTextStyle.bodyText,
                  ),
                ),
                const Spacer(),
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: InkWell(
                    highlightColor: KColor.transparent,
                    splashColor: KColor.transparent,
                    hoverColor: KColor.transparent,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: const AddEmployeesDialogCard(),
                            );
                          });
                    },
                    child: Image.asset('assets/images/add.png',
                        height: KSize.getHeight(context, 30),
                        width: KSize.getWidth(context, 30),
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: KColor.white,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),

              ///List
              const EmployeeListScreen()
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> moveToLastScreen() async {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}

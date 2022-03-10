import 'package:flutter/material.dart';
import 'package:flutter_app/model/employee_model.dart';
import 'package:flutter_app/view/screens/profile/employees_profile_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: employeeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.nextReplacementPage(const EmployeesProfileScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: KSize.getHeight(context, 30)),
                child: Container(
                  height: KSize.getHeight(context, 192),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(-2, 1),
                          color: KColor.snow,
                          blurRadius: 10,
                          spreadRadius: 10),
                      BoxShadow(
                        color: KColor.snow,
                        blurRadius: 15.0,
                        offset: Offset(20.0, 10.0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      //const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 20)),
                        child: SizedBox(
                          height: KSize.getHeight(context, 60),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(employeeList[index].image,
                                  height: KSize.getHeight(context, 50),
                                  width: KSize.getWidth(context, 50),
                                  fit: BoxFit.contain),
                              SizedBox(width: KSize.getWidth(context, 16)),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(employeeList[index].name,
                                        style: KTextStyle.bodyText
                                            .copyWith(height: 1.8)),
                                    const Spacer(),
                                    Text(employeeList[index].email,
                                        style: KTextStyle.bodyText2
                                            .copyWith(color: KColor.grey,height: 1.2)),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Padding(
                                padding:  EdgeInsets.only(bottom:10.0),
                                child:  Icon(Icons.more_vert,),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: KSize.getHeight(context, 45)),

                      /// Calendar  /  created May
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 14)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender',
                                  style: KTextStyle.caption,
                                ),
                                Text('Male',
                                    style: KTextStyle.subTitle1
                                        .copyWith(color: KColor.black)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Position',
                                  style: KTextStyle.bodyText2
                                      .copyWith(color: KColor.grey),
                                ),
                                Text(employeeList[index].designation,
                                    style: KTextStyle.subTitle1
                                        .copyWith(color: KColor.black)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'On Task',
                                  style: KTextStyle.caption,
                                ),
                                Text('25',
                                    style: KTextStyle.subTitle1
                                        .copyWith(color: KColor.black)),
                              ],
                            ),
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

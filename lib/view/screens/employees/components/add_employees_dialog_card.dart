import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class AddEmployeesDialogCard extends StatelessWidget {
  const AddEmployeesDialogCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: KColor.white,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getHeight(context, 20)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Employees',
                      style: KTextStyle.headline8.copyWith(fontSize: 18)),
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
            SizedBox(height: KSize.getHeight(context, 30)),
            Padding(
              padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
              child: Text(
                'Name',
                style: KTextStyle.caption,
              ),
            ),
            /// Name TextField
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: const KTextField(
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 15)),

            /// Email
            Padding(
              padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
              child: Text(
                'Email',
                style: KTextStyle.caption,
              ),
            ),
        
            /// Business Direction
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: const KTextField(
                hintText: 'Enter Email',
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 35)),

            /// Button

            Padding(
              padding: EdgeInsets.only(
                left: KSize.getWidth(context, 11),
                right: KSize.getWidth(context, 14),
              ),
              child: Container(
                  height: KSize.getHeight(context, 58),
                  decoration: BoxDecoration(
                    color: KColor.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: KColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add",
                      style: KTextStyle.bodyText
                          .copyWith(color: KColor.white, fontSize: 15),
                    ),
                  )),
            ),
            SizedBox(height: KSize.getHeight(context, 38)),
          ],
        ),
      ),
    );
  }
}

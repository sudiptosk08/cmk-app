import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class CreateTeamCard extends StatelessWidget {
  const CreateTeamCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 510),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: KColor.aliceBlue,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getHeight(context, 24)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Create New Team',
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
            SizedBox(height: KSize.getHeight(context, 20)),

            /// NAme TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: const KTextField(
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 30)),

            /// Business Direction
            Padding(
              padding: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Text(
                'Business Direction',
                style: KTextStyle.caption,
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 20)),

            /// Business Direction
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: const KTextField(
                hintText: 'Type',
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 30)),
            Padding(
              padding: EdgeInsets.only(left: KSize.getWidth(context, 24)),
              child: Row(
                children: [
                  const Icon(Icons.add, color: KColor.primary),
                  SizedBox(width: KSize.getWidth(context, 11)),
                  Text(
                    'Add another Member',
                    style: KTextStyle.subTitle1.copyWith(color: KColor.primary),
                  )
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 30)),
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
            SizedBox(height: KSize.getHeight(context, 20)),
          ],
        ),
      ),
    );
  }
}

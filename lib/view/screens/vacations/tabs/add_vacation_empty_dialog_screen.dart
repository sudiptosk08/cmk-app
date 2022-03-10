import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class AddVacationEmptyDialogScreen extends StatelessWidget {
  const AddVacationEmptyDialogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 533),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: KColor.white,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getWidth(context, 15)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Vacation',
                      style: KTextStyle.headline8.copyWith(fontSize: 18)),
                  Transform.translate(
                    offset: const Offset(15, 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 10)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Container(
                height: KSize.getHeight(context, 299),
                decoration:
                    BoxDecoration(border: Border.all(color: KColor.whiteSmoke),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                          //style: TextStyle(color:),
                          //controller: description,
                          maxLines: 4,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: KSize.getWidth(context, 15),
                                vertical: KSize.getHeight(context, 15)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Note',
                            hintStyle:KTextStyle.bodyText.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),),
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 20)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('May 22 - May 24',
                      style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
                  Text('3 Days',
                      style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
                ],
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 30)),

            /// Add Button
            Container(
                margin: EdgeInsets.only(
                  left: KSize.getWidth(context, 13),
                  right: KSize.getWidth(context, 12),
                ),
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
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: KTextStyle.bodyText
                        .copyWith(color: KColor.white, fontSize: 15),
                  ),
                )),
             SizedBox(height: KSize.getHeight(context, 20)),
          ],
        ),
      ),
    );
  }
}

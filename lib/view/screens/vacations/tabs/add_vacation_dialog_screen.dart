import 'package:flutter/material.dart';
import 'package:flutter_app/view/screens/vacations/tabs/add_vacation_empty_dialog_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddVacationDialogScreen extends StatelessWidget {
  const AddVacationDialogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 622),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: KColor.white,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: KSize.getWidth(context, 18)),
            Padding(
                padding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
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
            //SizedBox(height: KSize.getHeight(context, 20)),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
              child: SfDateRangePicker(
                rangeSelectionColor: KColor.primary.withOpacity(0.5),
                startRangeSelectionColor: KColor.primary,
                endRangeSelectionColor: KColor.primary,
                todayHighlightColor: KColor.primary,
                selectionColor: KColor.primary,
                view: DateRangePickerView.month,
                rangeTextStyle: KTextStyle.bodyText.copyWith(color: KColor.white),
                allowViewNavigation: true,
                enableMultiView: false,
                headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: KTextStyle.headline8.copyWith(fontSize: 18)),
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                selectionMode: DateRangePickerSelectionMode.range,
              ),
            ),
            SizedBox(height: KSize.getHeight(context, 14)),
            Padding(
              padding: EdgeInsets.only(
                left: KSize.getWidth(context, 31),
              ),
              child: Text('May 22-May 24',
                  style: KTextStyle.subTitle1.copyWith(color: KColor.black)),
            ),
            SizedBox(height: KSize.getHeight(context, 20)),

            /// Continue Button
            Padding(
              padding: EdgeInsets.only(
                left: KSize.getWidth(context, 13),
                right: KSize.getWidth(context, 12),
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
                      showDialog(
                          context: context,
                          builder: (context) {
                            return   Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                child: const AddVacationEmptyDialogScreen());
                          });
                    },
                    child: Text(
                      "Continue",
                      style: KTextStyle.bodyText
                          .copyWith(color: KColor.white, fontSize: 15),
                    ),
                  )),
            ),
            SizedBox(height: KSize.getHeight(context, 18)),
          ],
        ),
      ),
    );
  }
}

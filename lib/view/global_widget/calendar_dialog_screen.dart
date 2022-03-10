import 'package:flutter/material.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarDialogScreen extends StatelessWidget {
  const CalendarDialogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 518),
      decoration: BoxDecoration(
          color: KColor.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: KSize.getHeight(context, 31)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
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
          SizedBox(width: KSize.getWidth(context, 42)),
          Padding(
            padding: EdgeInsets.only(
              left: KSize.getWidth(context, 31),
              right: KSize.getWidth(context, 28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('To', style: KTextStyle.caption),
                    SizedBox(height: KSize.getHeight(context, 12)),
                    Text('Nov 11,2021',
                        style:
                            KTextStyle.subTitle1.copyWith(color: KColor.black)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('From', style: KTextStyle.caption),
                    SizedBox(height: KSize.getHeight(context, 12)),
                    Text('Select Date', style: KTextStyle.subTitle1),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/message_bottom_sheet.dart';

class MessagePersonScreen extends StatefulWidget {
  const MessagePersonScreen({Key key}) : super(key: key);

  @override
  State<MessagePersonScreen> createState() => _MessagePersonScreenState();
}

class _MessagePersonScreenState extends State<MessagePersonScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: KColor.white,
        appBar: KAppBar(
          onPressed: () {
          Navigator.pop(context);
          },
         automaticallyImplyLeading: true,
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
                    'Tony Stark',
                    style: KTextStyle.bodyText,
                  ),
                ),
                const Spacer(),
                Image.asset('assets/images/avatar5.png',
                    height: KSize.getHeight(context, 36),
                    width: KSize.getWidth(context, 36),
                    fit: BoxFit.contain),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.screenHeight - KSize.getHeight(context, 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: KSize.getHeight(context, 40)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: KSize.getWidth(context, 24)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text('Today at 10.35',
                                style: KTextStyle.caption)),
                        SizedBox(height: KSize.getHeight(context, 30)),

                        /// Hello,where r u // Time
                        InkWell(
                          hoverColor: KColor.transparent,
                          splashColor: KColor.transparent,
                          highlightColor: KColor.transparent,
                          onLongPress: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, setState) {
                                      return const MessageBottomSheet();
                                    },
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/avatar5.png',
                                  height: KSize.getHeight(context, 48),
                                  width: KSize.getWidth(context, 48),
                                  fit: BoxFit.contain),
                              SizedBox(width: KSize.getWidth(context, 15)),
                              Container(
                                height: KSize.getHeight(context, 48),
                                width: KSize.getWidth(context, 196),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: KColor.whiteSmoke2,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text('Hello,where are you?',
                                    style: KTextStyle.bodyText2.copyWith(
                                        fontSize: 15, color: KColor.black)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: KSize.getHeight(context, 10)),

                        /// 10.35
                        Padding(
                          padding:
                              EdgeInsets.only(left: KSize.getWidth(context, 63)),
                          child: Text('10:35', style: KTextStyle.caption),
                        ),

                        SizedBox(height: KSize.getHeight(context, 30)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: KSize.getHeight(context, 48),
                            width: KSize.getWidth(context, 275),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: KColor.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('At home! Just finish my work',
                                style:
                                    KTextStyle.bodyText2.copyWith(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: KSize.getHeight(context, 20)),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: KSize.getHeight(context, 48),
                            width: KSize.getWidth(context, 200),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: KColor.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('What\'s your update?',
                                style:
                                    KTextStyle.bodyText2.copyWith(fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: KSize.getHeight(context, 30)),
                        InkWell(
                          hoverColor: KColor.transparent,
                          splashColor: KColor.transparent,
                          highlightColor: KColor.transparent,
                          onLongPress: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, setState) {
                                      return const MessageBottomSheet();
                                    },
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/avatar5.png',
                                  height: KSize.getHeight(context, 48),
                                  width: KSize.getWidth(context, 48),
                                  fit: BoxFit.contain),
                              SizedBox(width: KSize.getWidth(context, 15)),
                              Container(
                                height: KSize.getHeight(context, 75),
                                width: KSize.getWidth(context, 196),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: KColor.whiteSmoke2,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text('Almost Done,Need\n5 min to submit',
                                    style: KTextStyle.bodyText2.copyWith(
                                        fontSize: 15, color: KColor.black)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: KSize.getHeight(context, 10)),

                        /// 10.35
                        Padding(
                          padding:
                              EdgeInsets.only(left: KSize.getWidth(context, 63)),
                          child: Text('10:35', style: KTextStyle.caption),
                        ),
                      ],
                    ),
                  ),
                ),

                // const Spacer(),
                /* const Spacer(),
               const Spacer(),
               const Spacer(),
               const Spacer(),*/
                //const Spacer(),

                /// SMS SEND TEXTFIELD
                Container(
                  height: KSize.getHeight(context, 62),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: KColor.grey.withOpacity(0.5),
                        offset: const Offset(0.0, -1.0), //(x,y)
                        blurRadius: 0.0,
                      ),
                    ],
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      scrollPadding: const EdgeInsets.all(20.0),
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Type your message here...',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: KSize.getWidth(context, 24),
                            right: KSize.getWidth(context, 14),
                            top: KSize.getHeight(context, 16),
                            bottom: KSize.getHeight(context, 22),
                          ),
                          child: Image.asset('assets/images/Icon.png'),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                            left: KSize.getWidth(context, 24),
                            right: KSize.getWidth(context, 23),
                            top: KSize.getHeight(context, 9),
                            bottom: KSize.getHeight(context, 9),
                          ),
                          child: Image.asset('assets/images/sendButton.png'),
                        ),
                        //contentPadding: const EdgeInsets.symmetric(vertical: 20),
                        enabledBorder:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    
    );
  }
}

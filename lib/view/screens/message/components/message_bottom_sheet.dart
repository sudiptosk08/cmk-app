import 'package:flutter/material.dart';
import 'package:flutter_app/model/message_action_model.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';

class MessageBottomSheet extends StatelessWidget {
  const MessageBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSize.getHeight(context, 326),
      decoration: const BoxDecoration(
          color: KColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: KSize.getHeight(context, 12)),
                Center(
                  child: Image.asset(
                    'assets/images/holder.png',
                    height: KSize.getHeight(context, 4),
                    width: KSize.getWidth(context, 54),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: KSize.getHeight(context, 14)),
                Center(
                    child: Text('Select action with the message',
                        style: KTextStyle.headline8.copyWith(fontSize: 18))),
                SizedBox(height: KSize.getHeight(context, 30)),
                SizedBox(
                  height: KSize.getHeight(context, 250),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: KSize.getHeight(context, 25)),
                          child: Row(
                            children: [
                              Image.asset(
                                messageList[index].image,
                                height: KSize.getHeight(context, 24),
                                width: KSize.getWidth(context, 24),
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: KSize.getWidth(context, 14),
                              ),
                              Text(
                                messageList[index].text,
                                style: KTextStyle.subTitle1
                                    .copyWith(color: index==4?KColor.red:KColor.black, height: 1),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: KSize.getHeight(context, 28)),
              ],
            )),
      ),
    );
  }
}

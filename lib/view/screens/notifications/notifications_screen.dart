import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/screens/notifications/components/notification_card.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KAppBar(
            isCustomLeading: true,
            centerTitle: true,
            title: 'Notifications',
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: KColor.white,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Column(
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),
              const NotificationCard()
            ],
          ),
        ),
    );
  }
}

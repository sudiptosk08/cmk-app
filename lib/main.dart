import 'package:flutter/material.dart';
import 'package:flutter_app/route/route_class_builder.dart';
import 'package:flutter_app/view/screens/auth/login_screen.dart';

void main() {
  RouteClassBuilder.registerClasses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMK App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const LogInScreen(),
    );
  }
}

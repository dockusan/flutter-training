import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'helper/Constants.dart';
import 'HomePage.dart';

void main() => runApp(ContactlyApp());

class ContactlyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder> {
    loginPageTag: (context) => LoginPage(),
    homepageTag: (context) => HomePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(primaryColor: appDarkGreyColor),
      home: LoginPage(),
      routes: routes,
    );
  }
}

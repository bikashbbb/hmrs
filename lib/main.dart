import 'package:flutter/material.dart';
import 'package:new_project/screens/adminpanel/admin_dash.dart';
import 'package:flutter/services.dart';

void main() {
  // status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRMS',
      home: HomePage(),
    );
  }
}

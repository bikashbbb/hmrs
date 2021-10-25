import 'package:flutter/material.dart';
import 'package:new_project/pageroute.dart';
import 'package:new_project/screens/adminpanel/admin_dash.dart';
import 'package:flutter/services.dart';

void main() {
  // status bar color
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Pageroute pagerouter = Pageroute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ongenerateroute will use this functionn to route the pages.
      onGenerateRoute: pagerouter.router,
      debugShowCheckedModeBanner: false,
      title: 'HRMS',
      home: HomePage(),
    );
  }
}

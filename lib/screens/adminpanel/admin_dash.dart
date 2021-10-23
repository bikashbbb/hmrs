import 'package:flutter/material.dart';
import 'package:new_project/screens/adminpanel/appbar.dart';
import 'package:new_project/screens/adminpanel/customdrawer.dart';

class HomePage extends StatefulWidget {
  
  HomePage({Key? key}) : super(key: key);
  // height of screens
  static late double context_height;
  static late double context_width;
  // custom color
  static List<Color> custom_color = [Colors.orangeAccent, Colors.pinkAccent];
// drawe info 
static bool isdraweropen = false;
  static var inwhichpage = 'Admin Dashboard';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool setstat
  
  @override
  Widget build(BuildContext context) {
    HomePage.context_height = MediaQuery.of(context).size.height;
    HomePage.context_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // drawer ma click garesi yeha bata aawos euta drawer

          custom_drawer(HomePage.isdraweropen)
        ],
      ),
      appBar: PreferredSize(
          preferredSize:
              Size(HomePage.context_width, HomePage.context_height / 14),
          child: custom_appbar(() {
            setState(() {
              HomePage.isdraweropen = !HomePage.isdraweropen;
            });
          })),
    );
  }
}

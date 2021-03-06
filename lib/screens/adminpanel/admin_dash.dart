import 'package:flutter/material.dart';
import 'package:new_project/constans/strings.dart';
import 'package:new_project/screens/adminpanel/appbar.dart';
import 'package:new_project/screens/adminpanel/customdrawer.dart';

import 'subcategory scrrens/dashboard/adminhome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context_height = MediaQuery.of(context).size.height;
    context_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          AdminPage(),
          // drawer ma click garesi yeha bata aawos euta drawer
          custom_drawer(isdraweropen)
        ],
      ),
      appBar: PreferredSize(
          preferredSize: Size(context_width, context_height / 14),
          child: custom_appbar(() {
            setState(() {
              isdraweropen = !isdraweropen;
            });
          })),
    );
  }
}

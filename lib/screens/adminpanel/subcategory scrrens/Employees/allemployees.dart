import 'package:flutter/material.dart';
import 'package:new_project/constans/strings.dart';
import 'package:new_project/screens/adminpanel/appbar.dart';
import 'package:new_project/screens/adminpanel/customdrawer.dart';

class All_Employees extends StatefulWidget {
  const All_Employees({Key? key}) : super(key: key);

  @override
  _All_EmployeesState createState() => _All_EmployeesState();
}

class _All_EmployeesState extends State<All_Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(context_width, context_height / 14),
          child: custom_appbar(() {
            setState(() {
              isdraweropen = !isdraweropen;
            });
          })),
      body: Stack(
        children: [custom_drawer(true)],
      ),
    );
  }
}

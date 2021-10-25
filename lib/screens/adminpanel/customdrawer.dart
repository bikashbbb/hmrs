import 'package:flutter/material.dart';
import 'package:new_project/constans/strings.dart';
import 'package:new_project/screens/adminpanel/drawer_items.dart';

class custom_drawer extends StatefulWidget {
  bool iscalled;
  custom_drawer(
    this.iscalled, {
    Key? key,
  }) : super(key: key);

  @override
  _custom_drawerState createState() => _custom_drawerState();
}

class _custom_drawerState extends State<custom_drawer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          color: Colors.black,
          width: widget.iscalled ? context_width / 1.7 : 0,
          child: widget.iscalled
              ? ListView(children: [
                  Container(
                    child: Padding(
                        // drawer items
                        padding: EdgeInsets.only(top: 9),
                        child: drawer_items()),
                  )
                ])
              : null,
        ),
        widget.iscalled
            ?
            // dark backeground .. with opacity
            Opacity(
                opacity: 0.25,
                child: Container(
                  color: Colors.black,
                  width: context_width - context_width / 1.7,
                ),
              )
            : Container()
      ],
    );
  }
}

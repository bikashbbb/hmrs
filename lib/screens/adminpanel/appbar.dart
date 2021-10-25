import 'package:flutter/material.dart';
import 'package:new_project/constans/colors.dart';
import 'package:new_project/constans/strings.dart';

class custom_appbar extends StatefulWidget {
  Function drawerclicked;
  custom_appbar(this.drawerclicked, {Key? key}) : super(key: key);

  @override
  _custom_appbarState createState() => _custom_appbarState();
}

class _custom_appbarState extends State<custom_appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.5),
      height: context_height / 10,
      width: context_width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer

          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: IconButton(
                onPressed: () {
                  widget.drawerclicked();
                },
                icon: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                  size: 34,
                )),
          ),
          // logo
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 40,
              width: 40,
              child: Image.asset('lib/assets/logo.png'),
            ),
          ),
          // setting
          IconButton(
              onPressed: () {
                // TODO: SETTINGS
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 34,
              ))
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black)],
          gradient: LinearGradient(colors: custom_color)),
    );
  }
}

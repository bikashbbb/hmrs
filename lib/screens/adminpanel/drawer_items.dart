import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constans/categories.dart';
import 'package:new_project/constans/deawer_controller.dart';
import 'package:new_project/constans/strings.dart';
import 'package:new_project/constans/subcategorydata.dart';
import 'package:expandable/expandable.dart';

class drawer_items extends StatefulWidget {
  const drawer_items({Key? key}) : super(key: key);

  @override
  _drawer_itemsState createState() => _drawer_itemsState();
}

class _drawer_itemsState extends State<drawer_items> {
  // list of controllers

// value
  bool ischildrendered = false;
  @override
  void initState() {
    super.initState();
    // lets delay for millisecs and do that. hell yeah
    Future.delayed(Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          ischildrendered = true;
          controllers[0].expanded = true;
        });
      }
    });
  }

  Widget category_header(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget sub_category(index, _title) {
    // builts out the subcategory
    return Padding(
      padding: EdgeInsets.only(left: 56, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, subcategory[_title]![index]);
          setState(() {
            // chnage the state of the clicked text
            inwhichpage = subcategory[_title]![index];
          });
        },
        child: Text(
          subcategory[_title]![index],
          style: TextStyle(
              color: inwhichpage == subcategory[_title]![index]
                  ? Colors.orange
                  : Colors.white),
        ),
      ),
    );
  }

  Widget _category(String Title, IconData input_icon, int index) {
    if (ischildrendered) {
      return ExpandablePanel(
          controller: controllers[index],
          header: Container(
              width: 20,
              height: 20,
              child: ListTile(
                minLeadingWidth: 20.0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(Title,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                leading: Icon(
                  input_icon,
                  color: Colors.white,
                  size: 23,
                ),
              )),
          theme: ExpandableThemeData(
              expandIcon: Icons.arrow_right,
              collapseIcon: Icons.arrow_drop_down,
              hasIcon: true,
              iconColor: Colors.white,
              iconPadding: EdgeInsets.only(right: 10, top: 15)),
          collapsed: Text(
            '',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          expanded: ListView.builder(
              shrinkWrap: true,
              itemCount: map_length(subcategory[Title]),
              itemBuilder: (context, i) {
                return sub_category(i, Title);
              }));
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // main
        category_header('Main'),
        Divider(
          color: Colors.black,
          height: 8,
        ),
        _category(dashboard, Icons.dashboard, 0),
        _category(Apps_category, Icons.apps, 1),
        //employye
        ischildrendered ? category_header('Employees') : Container(),
        _category(Employees, Icons.person, 2),
      ],
    );
  }
}

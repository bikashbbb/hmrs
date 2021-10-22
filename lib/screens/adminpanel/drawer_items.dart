import 'package:flutter/material.dart';
import 'package:new_project/screens/adminpanel/admin_dash.dart';

class drawer_items extends StatefulWidget {
  const drawer_items({Key? key}) : super(key: key);

  @override
  _drawer_itemsState createState() => _drawer_itemsState();
}

class _drawer_itemsState extends State<drawer_items> {
  void sub_category(List<String> Next_page) {
    // TODO: take in list of next page
  }

  Widget category(
    IconData input_icon,
    String Title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        color: Colors.amberAccent,
        width: HomePage.context_width / 1.7,
        child: MaterialButton(
          onPressed: () {
            // get the subcategory ..
          },
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0,
                child: Icon(
                  input_icon,
                  color: Colors.white,
                ),
              ),

              // another icon
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 190),
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
              // title
              Positioned(
                left: 20,
                top: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Text(
                        Title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // sub category
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Main',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        // catalog of category
        category(Icons.dashboard_rounded, 'Dashboard'),
        category(Icons.dashboard_rounded, 'Dashboard'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_project/screens/adminpanel/admin_dash.dart';
import 'package:new_project/screens/subcategorydata.dart';

class drawer_items extends StatefulWidget {
  const drawer_items({Key? key}) : super(key: key);

  @override
  _drawer_itemsState createState() => _drawer_itemsState();
}

class _drawer_itemsState extends State<drawer_items> {
  //subcategory clicked
  bool subcategory_clicked = false;
  // category icon changed
  bool categorycicked = false;
  // which category to change
  Map<String, bool> changethis = {};
  // expansion key
  GlobalKey expansion_key = GlobalKey();

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
      padding: EdgeInsets.only(left: 73, bottom: 14),
      child: InkWell(
        onTap: () {
          // navigator
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
            return subcategory[_title]![index][1];
          }));
          setState(() {
            // chnage the state of the clicked text
            HomePage.inwhichpage = subcategory[_title]![index][0];
          });
        },
        child: Text(
          subcategory[_title]![index][0],
          style: TextStyle(
              color: HomePage.inwhichpage == subcategory[_title]![index][0]
                  ? Colors.orange
                  : Colors.white),
        ),
      ),
    );
  }

  Widget category(
    IconData input_icon,
    String Title,
  ) {
    // BUILTS OUT THE CATEGORY
    return Container(
      width: HomePage.context_width / 1.7,
      child: ExpansionTile(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: map_length(subcategory[Title]),
              itemBuilder: (context, int) {
                return sub_category(int, Title);
              })
        ],
        onExpansionChanged: (ischanged) {
          print(expansion_key.currentWidget);
          setState(() {
            // change the icon
            if (changethis.containsKey(Title)) {
              changethis[Title] = ischanged;
            } else {
              changethis.addAll({Title: ischanged});
            }
          });
        },
        trailing: changethis[Title] == true
            ? Icon(Icons.arrow_drop_down)
            : Icon(Icons.arrow_right),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        leading: Icon(
          input_icon,
          color: Colors.white,
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            Title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // main
        category_header('main'),
        // catalog of category
        category(Icons.dashboard_rounded, 'Dashboard'),
        //category(Icons.apps, 'Apps'),
        // Employees
        category_header('Employees'),
        // %%% Category of employees %%%
        //category(input_icon, Title)
      ],
    );
  }
}

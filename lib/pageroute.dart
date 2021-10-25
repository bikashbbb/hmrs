import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constans/categories.dart';
import 'package:new_project/constans/subcategorydata.dart';
import 'constans/pages.dart';

class Pageroute {
  Route router(RouteSettings settings) {
    // dashboard
    if (settings.name == subcategory[dashboard]![0]) {
      return pagenavigator(0);
    } else if (settings.name == subcategory[dashboard]![1]) {
      return pagenavigator(1);
    }
    // app
    else if (settings.name == subcategory[Apps_category]![0]) {
      return pagenavigator(0);
    } else if (settings.name == subcategory[Apps_category]![1]) {
      return pagenavigator(1);
    }
    // employees
    else if (settings.name == subcategory[Employees]![0]) {
      return pagenavigator(2);
    }

    return pagenavigator(0);
  }

  pagenavigator(int index) {
    return MaterialPageRoute(builder: (contx) {
      return AllpagesLIST[index];
    });
  }
}

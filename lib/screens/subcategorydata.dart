import 'package:new_project/screens/adminpanel/admin_dash.dart';
import 'package:new_project/screens/adminpanel/subcategory%20scrrens/employeedash.dart';

Map<String, Map> subcategory = {
  'Dashboard': {
    0: [
      'Admin Dashboard',
      HomePage(),
    ],
    1: [
      'Employee Dashboard',
      Employye_interface(),
    ],
  },
  'Apps': {
    0: [
      'Chat',
      Employye_interface(),
    ],
    1: [
      'calls',
      Employye_interface(),
    ],
    2: [
      'Calender',
      Employye_interface(),
    ],
    3: [
      'Contacts',
      Employye_interface(),
    ],
    4: [
      'Email',
      Employye_interface(),
    ],
    5: [
      'File Manager',
      Employye_interface(),
    ]
  },
};

int map_length(input) {
  return input.length;
}

pagenavigator() {}

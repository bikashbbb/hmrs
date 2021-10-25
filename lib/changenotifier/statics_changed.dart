import 'package:new_project/models/dashboard%20/dashboardmodels.dart';

class statits_state {
  final totalincome = [
    new Total_revenue('2014', 100),
    new Total_revenue('2015', 25),
    new Total_revenue('2016', 100),
    new Total_revenue('2017', 75),
    new Total_revenue('2018', 60),
  ];
  final total_outcome = [
    new Total_revenue('2014', 90),
    new Total_revenue('2015', 10),
    new Total_revenue('2016', 75),
    new Total_revenue('2017', 60),
    new Total_revenue('2018', 60),
  ];

  List<Total_revenue> get_totalincome() {
    // todo get the data from the database,
    return totalincome;
  }

  List<Total_revenue> get_totaloutcome() {
    return total_outcome;
  }
}

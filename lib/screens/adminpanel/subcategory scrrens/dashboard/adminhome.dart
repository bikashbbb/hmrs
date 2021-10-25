import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/changenotifier/statics_changed.dart';
import 'package:new_project/constans/strings.dart';
import 'package:new_project/models/dashboard%20/dashboardmodels.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:new_project/models/dashboard%20/employyemodel.dart';
import 'package:new_project/models/dashboard%20/office_transaction.dart';

// TODO: MAKE THE DATA OF ADMIN PANEL IN SHARED PREFRENCES
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    var office_trade = Office_transaction();
    return Container(
      height: context_height,
      width: context_width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // welcome admin
            Padding(
              padding: const EdgeInsets.only(right: 222, top: 10),
              child: Text(
                'Welcome Admin!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            // list tile cards
            info_listtiles(
                Adminpagedata().projects, 'Projects', Icons.work_outline),
            info_listtiles(Adminpagedata().clients, 'Clients',
                Icons.monetization_on_outlined),
            info_listtiles(
                Adminpagedata().tasks, 'Tasks', Icons.task_alt_rounded),
            // employees
            info_listtiles(
                Adminpagedata().employees, 'Employees', Icons.person),
            // statics
            Divider(
              height: 26,
              color: Colors.white,
            ),
            Container(
                height: 390,
                width: context_width - 15,
                child: Card(
                  child: Column(
                    // total revenue card
                    children: [
                      Divider(
                        height: 15,
                        color: Colors.white,
                      ),
                      Text(
                        'Total Revenue',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.white,
                      ),
                      // statics
                      Totalrevenue_statics()
                    ],
                  ),
                )),
            Divider(
              height: 30,
              color: Colors.white,
            ),

            // employee details
            employee_card(
                'New Employees',
                Employeemodel().newemployee,
                Employeemodel().new_employee_chnage,
                Employeemodel().overall_employee),

            // Earnings
            employee_card('Earnings', office_trade.Earnings_this_month,
                office_trade.Earning_change, office_trade.previous_month_earning),

            // expenses
            employee_card(
                'Expenses',
                office_trade.current_expenses,
                office_trade.expenses_change,
                office_trade.previous_month_expense),

            // profit
            employee_card(
                'Profit',
                office_trade.current_profit,
                office_trade.profit_loss,
                office_trade.previous_profit)

          ],
        ),
      ),
    );
  }

  Widget Totalrevenue_statics() {
    // chart data
    return Container(
      height: 300,
      width: context_width - 60,
      child: charts.BarChart(
        [
          charts.Series(
              colorFn: (obj, int) {
                return charts.MaterialPalette.deepOrange.makeShades(200)[1];
              },
              id: 'id ',
              data: statits_state().get_totalincome(),
              domainFn: (obj, i) {
                return obj.year;
              },
              measureFn: (obj, i) {
                return obj.value;
              }),
          charts.Series(
              colorFn: (obj, int) {
                return charts.MaterialPalette.pink.makeShades(0)[0];
              },
              id: 'new ',
              data: statits_state().get_totaloutcome(),
              domainFn: (obj, i) {
                return obj.year;
              },
              measureFn: (obj, i) {
                return obj.value;
              }),
        ],
        vertical: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }

  Widget info_listtiles(int titles, String subtitle, IconData _icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 100,
        width: context_width - 15,
        child: Card(
          elevation: 2,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //icon inside
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange[100],
                  child: Container(
                    child: Icon(
                      _icon,
                      color: Colors.orange[400],
                      size: 30,
                    ),
                  ),
                ),
              ),
              // infos
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 60,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$titles',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget employee_card(fieldname, header, change, tail) {
    return Container(
      width: context_width - 15,
      height: 130,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fieldname,
                    style: TextStyle(),
                  ),
                  change[0] == '+'
                      ? Text(
                          change,
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(
                          change,
                          style: TextStyle(color: Colors.red),
                        )
                ],
              ),
            ),
            // header
            Container(
              width: context_width - 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    fieldname == 'New Employees'
                        ? header.toString()
                        : '\$$header',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // graph
            Divider(
              color: Colors.white,
              height: 8,
            ),
            Container(
              alignment: Alignment(-0.99, 0),
              height: 5,
              width: context_width - 48,
              color: Colors.black12,
              child: Container(
                color: Colors.orange,
                width: context_width - 200,
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                width: context_width - 48,
                child: fieldname == 'New Employees'
                    ? Text(
                        'Overall Employees $tail',
                      )
                    : Text(
                        'Previous Month  \$$tail',
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

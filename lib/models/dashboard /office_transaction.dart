class Office_transaction {
  int Earnings_this_month = 142300;
  int previous_month_earning = 115852;
  int current_expenses = 8500;
  int previous_month_expense = 7500;
  int current_profit = 112000;
  int previous_profit = 142000;
  String Earning_change = '+12.5%';

  get expenses_change {
    // TODO: get the accurate after calulating
    return '-2.8%';
  }

  get profit_loss {
    int p_l;
    if (current_profit > previous_profit) {
      p_l = ((current_profit - previous_profit) * 100 ~/ previous_profit);
      return '+$p_l%';
    } else {
      p_l = ((previous_profit - current_profit) * 100 ~/ previous_profit);
      return '-$p_l%';
    }
  }
}

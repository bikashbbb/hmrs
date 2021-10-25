class Adminpagedata {
// TODO: THIS DATA SHOULD BE COMING FROM THE DATABASE and saving in this class
  int projects;
  int clients;
  int tasks;
  int employees;

  // creating a constructor so that the object can be returned
  Adminpagedata(
      {this.projects = 112,
      this.clients = 44,
      this.tasks = 37,
      this.employees = 218});
}

class Total_revenue {
  String year;
  int value;
  Total_revenue(this.year, this.value);
}

class CountriesModel {
  List<CountriesModel> response;
  List<String> errors;
  String get;
  int results;
  Paging paging;
  List<dynamic> parameters;
}


class Paging {
  int current;
  int total;

  Paging(int current, int total) {
    this.current = current;
    this.total = total;
  }
}

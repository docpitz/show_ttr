class Result {
  String firstname;
  String lastname;
  int point;
  String result;
  List<String>? setResults;

  Result(this.firstname, this.lastname, this.point, this.result,
      this.setResults);

  static List<Result> examples = [
    Result("Florian", "Pitz", 1649, "3:2",
        ["11:9", "9:11", "14:12", "12:14", "21:22"]),
    Result("Thomas", "Büttner", 1680, "0:3",
        ["11:9", "11:0", "11:0"]),
    Result("Philip", "Göldner", 1699, "3:2",
        ["11:9", "9:11", "14:12", "12:14", "21:22"])
  ];
}

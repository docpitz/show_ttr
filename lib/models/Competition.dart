class Competition {
  int number;
  String date;
  String time;
  String league;
  String versus;
  String result;
  int quote;
  int pointWinning;
  int pointBevor;

  Competition(this.number, this.date, this.time, this.league, this.versus,
      this.result, this.quote, this.pointWinning, this.pointBevor);

  static List<List<Competition>> items = [Competition.examples_1, Competition.examples_2, Competition.examples_3];

  static List<Competition> examples_1 = [
    Competition(23, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(22, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(21, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(20, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(19, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(18, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(17, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(16, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1667),
    Competition(15, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(14, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(13, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(12, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(11, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(10, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(9, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(8, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1667),
    Competition(7, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(6, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(5, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(4, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(3, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(2, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(1, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(0, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1667),
  ];

  static List<Competition> examples_2 = [
    Competition(23, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(22, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(21, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(20, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(19, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(18, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(17, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(16, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1667),
    Competition(15, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(14, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(13, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(12, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(11, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(10, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(9, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(8, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1667),
    Competition(7, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 1685),
    Competition(6, "13.11.2021", "19:30 Uhr", "BOL-Herren",
        "ESV München-Freimann : TSV Hofolding", "1:1", 16, 0, 1685),
    Competition(5, "12.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : FC Bayern München IV", "2:0", 16, 6, 1679),
    Competition(4, "29.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : PSV München", "2:0", 16, 4, 1675),
    Competition(3, "16.10.2021", "19:30 Uhr", "BOL-Herren",
        "SV Schwarz-Weiß München : TSV Hofolding", "1:1", 16, 14, 1661),
    Competition(2, "01.10.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : TSV Feldkirchen", "1:1", 16, 3, 1658),
    Competition(1, "24.09.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Schwabhausen : TSV Hofolding", "1:1", 16, 8, 1650),
    Competition(0, "14.08.2021", "15:00 Uhr", "Sommer-Team-Cup 2021",
        "KoopSP Landshut 1 - team123 - Herren", "0:2", 16, -17, 1330),
  ];

  static List<Competition> examples_3 = [
    Competition(0, "19.11.2021", "19:30 Uhr", "BOL-Herren",
        "TSV Hofolding : ESV München-Ost", "2:0", 16, 15, 900),
  ];
}

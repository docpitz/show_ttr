class Player {
  int position;
  String lastname;
  String firstname;
  int points;

  Player(this.position, this.firstname, this.lastname, this.points);

  static List<Player> examples = [
    Player(1, 'Johannes', 'Wutte', 1700),
    Player(2, 'Philip', 'Göldner', 1699),
    Player(3, 'Thomas', 'Büttner', 1686),
    Player(4, 'Luis', 'Kasten', 1681),
    Player(5, 'Sarayuth', 'Schwindt', 1660),
    Player(6, 'Florian', 'Pitz', 1649),
  ];
}
enum GameModeType {
  superLeage("Credit Suisse Super League", 21.30),
  championsLeage("UEFA Champions League", 21.30),
  cup("Schweizer Cup", 30.0);
  const GameModeType(this.name, this.ticketPrice);
  final String name;
  final double ticketPrice;
}

extension on GameModeType {
  double get getTicketPrice => ticketPrice;
}
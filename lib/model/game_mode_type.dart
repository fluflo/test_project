enum GameModeType {
  superLeage("Credit Suisse Super League", 21.30, "Saisonkarte 2023/24", "Vollpreis"),
  championsLeage("UEFA Champions League", 28.00, "Nein", "Vollpreis - Aborabatt"),
  cup("Schweizer Cup", 30.0, "Nein", "Vollpreis");
  const GameModeType(this.name, this.ticketPrice, this.abotype, this.tarif);
  final String name;
  final double ticketPrice;
  final String abotype;
  final String tarif;
}

extension on GameModeType {
  double get getTicketPrice => ticketPrice;
  String get getAboType => abotype;
  String get getTarif => tarif;
}
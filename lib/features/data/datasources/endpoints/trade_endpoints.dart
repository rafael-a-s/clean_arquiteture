class TradeEndPoints {
  static Uri getAllTrades() =>
      Uri.http('10.0.2.2:8090/api/collections/trade/records');
  static Uri createTrade() =>
      Uri.http('10.0.2.2:8090', '/api/collections/trade/records');
}

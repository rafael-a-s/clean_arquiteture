class TradeEndPoints {
  static Uri getAllTrades() =>
      Uri.http('127.0.0.1:8090/api/collections/trade/records');
  static Uri createTrade() =>
      Uri.http('127.0.0.1:8090', '/api/collections/trade/records');
}

class PortifolioEndPoints {
  static const _host = '10.0.2.2:3000';

  static Uri getAllPortifolios() => Uri.http(_host, '/portifolio');
  static Uri createPortifolio() => Uri.http(_host, '/portifolio');
}

class AssetsEndPoints {
  static const _host = '10.0.2.2:3000';

  static Uri getAllAssetsRecets() => Uri.http(_host, '/asset/recents');
}

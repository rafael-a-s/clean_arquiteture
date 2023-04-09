import 'package:my_app/features/data/models/assets_model.dart';

abstract class ITradeDataSource {
  Future<AssetsModel> getAllTrades();
  Future<AssetsModel> createTrade(AssetsModel assets);
}

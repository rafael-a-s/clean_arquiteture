import 'package:my_app/features/data/models/assets_model.dart';

abstract class ITradeDataSource {
  Future<List<AssetsModel>> getAllTrades();
  Future<AssetsModel> createTrade(AssetsModel assets);
}

import 'package:my_app/features/data/models/coin_model.dart';

abstract class ICoinDataSource {
  Future<CoinModel> getCoinSymbol(String symbol);
  Future<List<CoinModel>> getAllSymbol();
}

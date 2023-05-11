import 'package:my_app/features/data/models/portifolio_model.dart';

abstract class ICoinDataSource {
  Future<CoinModel> getCoinSymbol(String symbol);
  Future<List<CoinModel>> getAllSymbol();
}

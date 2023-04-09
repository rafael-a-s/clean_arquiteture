import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/trade/create.dart';

class TradeStore extends NotifierStore<Failure, Coin> {
  final CoinUseCase usecase;
  final CreateTradeUseCase usecaseTrade;

  TradeStore(this.usecase, this.usecaseTrade)
      : super(const Coin(symbol: '', price: 0.0));

  getCoinSymbol(String symbol) async {
    setLoading(true);
    final result = await usecase(symbol);
    setLoading(false);
    return result.fold(
      (error) => const Coin(
        symbol: '',
        price: 0.0,
      ),
      (success) => success,
    );
  }

  createTrade(Assets assets) async {
    setLoading(true);
    final result = await usecaseTrade(assets);
    setLoading(false);
    return result.fold(
      (error) => const Assets(
        symbol: '',
        amount: 0.0,
        price: 0.0,
      ),
      (sucess) => sucess,
    );
  }
}

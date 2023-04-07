import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin_usecase.dart';

class TradeStore extends NotifierStore<Failure, Coin> {
  final CoinUseCase usecase;

  TradeStore(this.usecase) : super(const Coin(symbol: '', price: 0.0));

  getCoinSymbol(String symbol) async {
    setLoading(true);
    final result = await usecase(symbol);
    setLoading(false);
    return result.fold(
      (error) =>
          Coin(symbol: '', price: 0.0), // valor padrão para o caso de erro
      (success) => success,
    );
  }
}

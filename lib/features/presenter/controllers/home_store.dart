import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';

class HomeStore extends NotifierStore<Failure, Coin> {
  final CoinUseCase usecase;

  HomeStore(this.usecase) : super(const Coin(symbol: '', price: 0.0));

  Future<Coin> getCoinSymbol(String symbol) async {
    setLoading(true);
    final result = await usecase(symbol);
    setLoading(false);
    return result.fold(
      (error) => const Coin(
        symbol: '',
        price: 0.0,
      ),
      (sucess) => sucess,
    );
  }
}

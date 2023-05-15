import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';

class HomeStore extends NotifierStore<Failure, Coin> {
  final CoinUseCase usecase;
  final GetAllPortifolioUseCase getAllPortifolioUseCase;

  HomeStore(
    this.usecase,
    this.getAllPortifolioUseCase,
  ) : super(
          const Coin(
            symbol: '',
            price: 0.0,
          ),
        );

  Future<List<Portifolio>> getAllPortifolio() async {
    setLoading(true);
    final result = await getAllPortifolioUseCase(NoParams());
    setLoading(false);
    return result.fold(
      (error) => <Portifolio>[
        const Portifolio(
          id: '',
          name: '',
          coin: '',
          subTotal: 0,
          totalPriceActual: 0,
          percent: 0,
          assets: [Assets(symbol: '', quanty: 0, price: 0)],
        ),
      ],
      (sucess) => sucess,
    );
  }

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

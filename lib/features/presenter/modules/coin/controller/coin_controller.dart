import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';

class CoinController {
  final GetAllCoinUseCase getAllCoinUseCase;
  final CoinUseCase getCoinSymbolUsecase;

  CoinController(
    this.getAllCoinUseCase,
    this.getCoinSymbolUsecase,
  );

  Future<List<Coin>> getAllCoinSymbol() async {
    final result = await getAllCoinUseCase(NoParams());
    return result.fold(
      (error) => const <Coin>[
        Coin(
          symbol: '',
          price: 0.0,
        ),
      ],
      (success) => success,
    );
  }

  getCoinSymbol(String symbol) async {
    final result = await getCoinSymbolUsecase(symbol);
    return result.fold(
      (error) => const Coin(
        symbol: '',
        price: 0.0,
      ),
      (success) => success,
    );
  }
}

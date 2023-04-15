import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';

class ListCoinStore extends NotifierStore<Failure, Coin> {
  final GetAllCoinUseCase usecase;

  ListCoinStore(
    this.usecase,
  ) : super(
          const Coin(symbol: '', price: 0.0),
        );

  getAllCoinSymbol() async {
    setLoading(true);
    final result = await usecase(NoParams());
    setLoading(false);
    return result.fold(
      (error) => const Coin(
        symbol: '',
        price: 0.0,
      ),
      (success) => success,
    );
  }
}

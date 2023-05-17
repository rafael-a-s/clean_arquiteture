import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';

class AddAssetStore extends NotifierStore<Failure, Portifolio> {
  final CoinUseCase usecase;
  final CreatePortifolioUseCase usecaseTrade;

  AddAssetStore(this.usecase, this.usecaseTrade)
      : super(
          const Portifolio(
            name: '',
            coin: '',
            subTotal: 0,
            totalPriceActual: 0,
            percent: 0,
            assets: [],
          ),
        );

  Future<Coin> getCoinSymbol(String symbol) async {
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

  addAsset(Portifolio portifolio) async {
    setLoading(true);
    final result = await usecaseTrade(portifolio);
    setLoading(false);
    return result.fold(
      (error) => const Portifolio(
        id: '',
        name: '',
        coin: '',
        subTotal: 0,
        totalPriceActual: 0,
        percent: 0,
        assets: [Assets(symbol: '', quanty: 0, price: 0)],
      ),
      (sucess) => sucess,
    );
  }
}

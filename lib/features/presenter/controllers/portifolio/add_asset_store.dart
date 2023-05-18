import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/add_asset_portifolio.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';

class AddAssetStore extends NotifierStore<Failure, Portifolio> {
  final AddAssetPortifolioUseCase usecaseAddAsset;

  AddAssetStore(
    this.usecaseAddAsset,
  ) : super(
          const Portifolio(
            name: '',
            coin: '',
            subTotal: 0,
            totalPriceActual: 0,
            percent: 0,
            assets: [],
          ),
        );

  Future<Portifolio> addAsset(String id, Assets asset) async {
    setLoading(true);
    final result = await usecaseAddAsset(
      TwoInputParams(
        id,
        asset,
      ),
    );

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

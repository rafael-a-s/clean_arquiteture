import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';

class CreatePortifolioStore extends NotifierStore<Failure, Portifolio> {
  final CreatePortifolioUseCase create;

  CreatePortifolioStore(
    this.create,
  ) : super(
          const Portifolio(
            id: '',
            name: '',
            coin: '',
            subTotal: 0,
            totalPriceActual: 0,
            percent: 0,
            assets: [Assets(symbol: '', quanty: 0, price: 0)],
          ),
        );

  createTrade(Portifolio portifolio) async {
    setLoading(true);
    final result = await create(portifolio);
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

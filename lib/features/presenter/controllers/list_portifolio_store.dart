import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';

class ListPortifolioStore extends NotifierStore<Failure, Portifolio> {
  final GetAllPortifolioUseCase usecase;

  ListPortifolioStore(
    this.usecase,
  ) : super(
          const Portifolio(
            id: '',
            name: '',
            subTotal: Double(),
            totalPriceActual: Double(),
            percent: Double(),
            assets: [Assets(symbol: '', quanty: 0, price: 0)],
          ),
        );

  getAllTrade() async {
    setLoading(true);
    final result = await usecase(NoParams());
    setLoading(false);
    return result.fold(
      (error) => const Portifolio(
        id: '',
        name: '',
        subTotal: Double(),
        totalPriceActual: Double(),
        percent: Double(),
        assets: [Assets(symbol: '', quanty: 0, price: 0)],
      ),
      (success) => success,
    );
  }
}

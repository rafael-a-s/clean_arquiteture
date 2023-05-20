import 'dart:ffi';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_infos_portifolio.dart';

class GeralPageStore extends NotifierStore<Failure, PortifolioInfo> {
  final GetInfoPortifolioUseCase getInfoUsecase;
  final GetAllPortifolioUseCase getAllPortifolioUseCase;

  GeralPageStore(
    this.getInfoUsecase,
    this.getAllPortifolioUseCase,
  ) : super(
          const PortifolioInfo(
            total: 0,
            totalUpdated: 0,
            pnl: 0,
            percent: 0,
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

  Future<PortifolioInfo> getInfoAboutPortifolio() async {
    setLoading(true);
    final result = await getInfoUsecase.call(NoParams());
    setLoading(false);
    return result.fold(
      (error) => const PortifolioInfo(
        total: 0,
        totalUpdated: 0,
        pnl: 0,
        percent: 0,
      ),
      (sucess) => sucess,
    );
  }
}

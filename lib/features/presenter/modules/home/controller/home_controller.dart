import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/usecases/assets/get_all_recents_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';

class HomeController {
  final GetAllPortifolioUseCase getAllPortifolioUseCase;
  final GetAllAssetsRecentsUseCase getAllAssetsRecentsUseCase;

  HomeController(
    this.getAllAssetsRecentsUseCase,
    this.getAllPortifolioUseCase,
  );

  Future<List<Portifolio>> getAllPortifolio() async {
    final result = await getAllPortifolioUseCase(NoParams());
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

  Future<List<Assets>> getAllAssetsRecents() async {
    final result = await getAllAssetsRecentsUseCase(NoParams());
    return result.fold(
      (error) => <Assets>[
        const Assets(
          symbol: '',
          price: 0.0,
          quanty: 0.0,
        )
      ],
      (sucess) => sucess,
    );
  }
}

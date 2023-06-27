import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/domain/usecases/portifolio/add_asset_portifolio.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_infos_portifolio.dart';

class PortifolioController {
  final CreatePortifolioUseCase createUsecase;
  final AddAssetPortifolioUseCase addAssetUsecase;
  final GetInfoPortifolioUseCase getInfoUsecase;
  final GetAllPortifolioUseCase getAllPortifolioUseCase;

  PortifolioController(
    this.createUsecase,
    this.addAssetUsecase,
    this.getInfoUsecase,
    this.getAllPortifolioUseCase,
  );

  createTrade(Portifolio portifolio) async {
    final result = await createUsecase(portifolio);
    return result.fold(
      (error) => Portifolio(
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

  Future<Portifolio> addAsset(String id, Assets asset) async {
    final result = await addAssetUsecase(
      TwoInputParams(
        id,
        asset,
      ),
    );

    return result.fold(
      (error) => Portifolio(
        id: '',
        name: '',
        coin: '',
        subTotal: 0,
        totalPriceActual: 0,
        percent: 0,
        assets: [const Assets(symbol: '', quanty: 0, price: 0)],
      ),
      (sucess) => sucess,
    );
  }

  Future<List<Portifolio>> getAllPortifolio() async {
    final result = await getAllPortifolioUseCase(NoParams());
    return result.fold(
      (error) => <Portifolio>[
        Portifolio(
          id: '',
          name: '',
          coin: '',
          subTotal: 0,
          totalPriceActual: 0,
          percent: 0,
          assets: [const Assets(symbol: '', quanty: 0, price: 0)],
        ),
      ],
      (sucess) => sucess,
    );
  }

  Future<PortifolioInfo> getInfoAboutPortifolio() async {
    final result = await getInfoUsecase.call(NoParams());
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

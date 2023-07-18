import 'package:my_app/core/data/datasources/i_base_datasource.dart';
import 'package:my_app/core/data/repositories/base_repository.dart';
import 'package:my_app/core/domain/base_model_convert.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/portifolio/i_portifolio_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class PortifolioRepository
    extends BaseRepository<Portifolio, PortifolioModel, dynamic>
    implements IPortifolioRepoitory {
  final ModelConvert<Portifolio, PortifolioModel> modelConvert = ModelConvert(
      fromEntity: (data) => Portifolio(
          id: data.id,
          name: data.name,
          coin: data.coin,
          subTotal: data.subTotal,
          totalPriceActual: data.totalPriceActual,
          percent: data.percent,
          assets: data.assets
              .map((value) => Assets(
                  id: value.id,
                  symbol: value.symbol,
                  quanty: value.quanty,
                  price: value.price))
              .toList()),
      toModel: (entity) => PortifolioModel(
          id: entity.id,
          name: entity.name,
          coin: entity.coin,
          subTotal: entity.subTotal,
          totalPriceActual: entity.totalPriceActual,
          percent: entity.percent,
          assets: entity.assets
              .map((value) => AssetsModel(
                  id: value.id,
                  symbol: value.symbol,
                  quanty: value.quanty,
                  price: value.price))
              .toList()));

  final IPortifolioDataSource _datasource;

  PortifolioRepository(this._datasource) : super(datasource: _datasource);

  @override
  Future<Either<Failure, Portifolio>> addAssetPortifolio(
      String id, Assets asset) async {
    try {
      final result = await datasource.addAssetPortifolio(
          id,
          AssetsModel(
            symbol: asset.symbol,
            quanty: asset.quanty,
            price: asset.price,
          ));

      return Right(Portifolio(
        id: result.id,
        name: result.name,
        coin: result.coin,
        percent: result.percent,
        subTotal: result.subTotal,
        totalPriceActual: result.totalPriceActual,
        assets: result.assets,
      ));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PortifolioInfo>> getInfoPortifolio() async {
    try {
      final result = await datasource.getInfoAboutPortifolio();
      return Right(
        PortifolioInfo(
          total: result.total,
          totalUpdated: result.totalUpdated,
          pnl: result.pnl,
          percent: result.percent,
        ),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  ModelConvert<Portifolio, PortifolioModel> getModelConvert() {
    return modelConvert;
  }

  @override
  IPortifolioDataSource get datasource => _datasource;
}

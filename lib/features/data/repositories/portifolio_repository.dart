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

class PortifolioRepository implements IPortifolioRepoitory {
  late final IPortifolioDataSource datasource;

  PortifolioRepository(this.datasource);

  @override
  Future<Either<Failure, List<Portifolio>>> getAllPortifolios() async {
    try {
      final result = await datasource.getAll();
      return Right(result
          .map((value) => Portifolio(
                id: value.id,
                name: value.name,
                coin: value.coin,
                percent: value.percent,
                subTotal: value.subTotal,
                totalPriceActual: value.totalPriceActual,
                assets: value.assets
                    .map((value) => Assets(
                          symbol: value.symbol,
                          quanty: value.quanty,
                          price: value.price,
                        ))
                    .toList(),
              ))
          .toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Portifolio>> createPortifolio(
      Portifolio portifolio) async {
    try {
      final result = await datasource.create(PortifolioModel(
        id: portifolio.id,
        name: portifolio.name,
        coin: portifolio.coin,
        percent: portifolio.percent,
        subTotal: portifolio.subTotal,
        totalPriceActual: portifolio.totalPriceActual,
        assets: portifolio.assets
            .map((value) => AssetsModel(
                  symbol: value.symbol,
                  quanty: value.quanty,
                  price: value.price,
                ))
            .toList(),
      ));

      return Right(Portifolio(
        id: result.id,
        name: result.name,
        coin: portifolio.coin,
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
  Future<Either<Failure, Portifolio>> get(dynamic id) async {
    try {
      final result = await datasource.get(id);
      return Right(
        Portifolio(
          name: result.name,
          coin: result.coin,
          subTotal: result.subTotal,
          totalPriceActual: result.totalPriceActual,
          percent: result.percent,
          assets: result.assets,
        ),
      );
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

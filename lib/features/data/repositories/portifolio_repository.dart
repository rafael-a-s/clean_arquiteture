import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/coin/i_coin_datasource.dart';
import 'package:my_app/features/data/datasources/portifolio/i_portifolio_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class PortifolioRepository implements IPortifolioRepoitory {
  late final IPortifolioDataSource datasource;

  PortifolioRepository(this.datasource);

  @override
  Future<Either<Failure, List<Portifolio>>> getAllPortifolios() async {
    try {
      final result = await datasource.getAllPortifolios();
      return Right(result
          .map((value) => Portifolio(
                id: value.id,
                name: value.name,
                percent: value.percent,
                subTotal: value.subTotal,
                totalPriceActual: value.totalPriceActual,
                assets: value.assets,
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
      final result = await datasource.createPortifolio(PortifolioModel(
        id: portifolio.id,
        name: portifolio.name,
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
        percent: result.percent,
        subTotal: result.subTotal,
        totalPriceActual: result.totalPriceActual,
        assets: result.assets,
      ));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

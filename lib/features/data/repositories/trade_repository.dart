import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/coin/i_coin_datasource.dart';
import 'package:my_app/features/data/datasources/trades/i_trade_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/repositories/i_trade_repository.dart';

class TradeRepository implements ITradeRepoitory {
  late final ITradeDataSource datasource;

  TradeRepository(this.datasource);

  @override
  Future<Either<Failure, List<Assets>>> getAllTrades() async {
    try {
      final result = await datasource.getAllTrades();
      return Right(result
          .map((asset) => Assets(
                id: asset.id,
                symbol: asset.symbol,
                price: asset.price,
                amount: asset.amount,
              ))
          .toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Assets>> createTrade(Assets assets) async {
    try {
      final result = await datasource.createTrade(AssetsModel(
        symbol: assets.symbol,
        amount: assets.amount,
        price: assets.price,
      ));

      return Right(Assets(
        id: result.id,
        symbol: result.symbol,
        amount: result.amount,
        price: result.price,
      ));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

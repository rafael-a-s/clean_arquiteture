import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/data/datasources/coin/i_coin_datasource.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_coin_repository.dart';
import 'package:pocketbase/pocketbase.dart';

class CoinRepository extends ICoinRepository {
  late final ICoinDataSource datasource;

  CoinRepository(this.datasource);

  @override
  Future<Either<Failure, Coin>> getCoinSymbol(String symbol) async {
    try {
      final result = await datasource.getCoinSymbol(symbol);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Coin>>> getAllCoin() async {
    try {
      final result = await datasource.getAllSymbol();

      return Right(result
          .map((coin) => Coin(
                price: coin.price,
                symbol: coin.symbol,
              ))
          .toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

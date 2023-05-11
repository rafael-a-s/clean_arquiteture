import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:dartz/dartz.dart';

abstract class ICoinRepository {
  Future<Either<Failure, Coin>> getCoinSymbol(String symbol);
  Future<Either<Failure, List<Coin>>> getAllCoin();
}

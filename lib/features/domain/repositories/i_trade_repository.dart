import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:dartz/dartz.dart';

abstract class ITradeRepoitory {
  Future<Either<Failure, List<Assets>>> getAllTrades();
  Future<Either<Failure, Assets>> createTrade(Assets assets);
}

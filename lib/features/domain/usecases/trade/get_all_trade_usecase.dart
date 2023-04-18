import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_coin_repository.dart';
import 'package:my_app/features/domain/repositories/i_trade_repository.dart';

class GetAllTradeUseCase implements Usecase<List<Assets>, NoParams> {
  late final ITradeRepoitory repository;

  GetAllTradeUseCase(this.repository);

  @override
  Future<Either<Failure, List<Assets>>> call(noParams) async {
    final result = await repository.getAllTrades();
    return result;
  }
}

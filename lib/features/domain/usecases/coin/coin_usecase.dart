import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_coin_repository.dart';

class CoinUseCase implements Usecase<Coin, String> {
  late final ICoinRepository repository;

  CoinUseCase(this.repository);

  @override
  Future<Either<Failure, Coin>> call(String symbol) async {
    return symbol != null
        ? await repository.getCoinSymbol(symbol)
        : Left(NullParamFailure());
  }
}

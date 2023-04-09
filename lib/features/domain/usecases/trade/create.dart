import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/repositories/i_trade_repository.dart';

class CreateTradeUseCase implements Usecase<Assets, Assets> {
  late final ITradeRepoitory repository;

  CreateTradeUseCase(this.repository);

  @override
  Future<Either<Failure, Assets>> call(Assets assets) async {
    return assets.props.isNotEmpty
        ? await repository.createTrade(assets)
        : Left(NullParamFailure());
  }
}

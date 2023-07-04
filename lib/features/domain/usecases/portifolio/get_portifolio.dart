import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class GetPortifolioUsecase implements Usecase<Portifolio, dynamic> {
  late final IPortifolioRepoitory repoitory;

  GetPortifolioUsecase(this.repoitory);

  @override
  Future<Either<Failure, Portifolio>> call(params) async {
    return await repoitory.get(params);
  }
}

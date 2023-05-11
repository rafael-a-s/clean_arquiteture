import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class CreatePortifolioUseCase implements Usecase<Portifolio, Portifolio> {
  late final IPortifolioRepoitory repository;

  CreatePortifolioUseCase(this.repository);

  @override
  Future<Either<Failure, Portifolio>> call(Portifolio portifolio) async {
    return portifolio.props.isNotEmpty
        ? await repository.createPortifolio(portifolio)
        : Left(NullParamFailure());
  }
}

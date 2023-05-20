import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class GetInfoPortifolioUseCase implements Usecase<PortifolioInfo, NoParams> {
  late final IPortifolioRepoitory repository;

  GetInfoPortifolioUseCase(this.repository);

  @override
  Future<Either<Failure, PortifolioInfo>> call(noParams) async {
    return await repository.getInfoPortifolio();
  }
}

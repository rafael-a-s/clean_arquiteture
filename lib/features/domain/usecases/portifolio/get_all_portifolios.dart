import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_coin_repository.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class GetAllPortifolioUseCase implements Usecase<List<Portifolio>, NoParams> {
  late final IPortifolioRepoitory repository;

  GetAllPortifolioUseCase(this.repository);

  @override
  Future<Either<Failure, List<Portifolio>>> call(noParams) async {
    final result = await repository.getAllPortifolios();
    return result;
  }
}

import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_portifolio_repository.dart';

class AddAssetPortifolioUseCase
    implements Usecase<Portifolio, TwoInputParams<String, Assets>> {
  late final IPortifolioRepoitory repository;

  AddAssetPortifolioUseCase(this.repository);

  @override
  Future<Either<Failure, Portifolio>> call(
      TwoInputParams<String, Assets> params) async {
    final id = params.input1;
    final asset = params.input2;

    return asset.props.isNotEmpty
        ? await repository.addAssetPortifolio(id, asset)
        : Left(NullParamFailure());
  }
}

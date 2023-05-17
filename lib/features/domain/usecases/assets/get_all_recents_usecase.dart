import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/repositories/i_assets_repository.dart';

class GetAllAssetsRecents implements Usecase<List<Assets>, NoParams> {
  late final IAssetsRepository repository;

  GetAllAssetsRecents(this.repository);

  @override
  Future<Either<Failure, List<Assets>>> call(NoParams params) async {
    final result = await repository.getAllAssetsRecets();
    return result.isRight() ? result : Left(ServerFailure());
  }
}

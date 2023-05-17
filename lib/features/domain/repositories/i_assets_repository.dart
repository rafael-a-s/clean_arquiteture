import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:dartz/dartz.dart';

abstract class IAssetsRepository {
  Future<Either<Failure, List<Assets>>> getAllAssetsRecets();
}

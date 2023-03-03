import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/example.dart';

abstract class IExampleRepository {
  Future<Either<Failure, Example>> getUserGitFormUsername(String username);
}
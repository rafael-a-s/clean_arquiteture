import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/data/datasources/example/i_example_datasource.dart';
import 'package:my_app/features/domain/entities/example.dart';
import 'package:my_app/features/domain/repositories/i_example_repository.dart';

class ExampleRepository extends IExampleRepository {

  late final IExampleDataSource datasource;

  ExampleRepository(this.datasource);

  @override
  Future<Either<Failure, Example>> getUserGitFormUsername(String username) async {
    try {
      final result = await datasource.getGitUser(username);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
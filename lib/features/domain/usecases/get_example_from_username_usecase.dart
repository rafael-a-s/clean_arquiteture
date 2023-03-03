import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/example.dart';
import 'package:my_app/features/domain/repositories/i_example_repository.dart';

class GetExampleFromUsernameUsecase implements Usecase<Example, String> {

  late final IExampleRepository repository;

  GetExampleFromUsernameUsecase(this.repository);

  @override
  Future<Either<Failure, Example>> call(String? username) async {
   return username != null ? await repository.getUserGitFormUsername(username) : Left(NullParamFailure());
  }

}
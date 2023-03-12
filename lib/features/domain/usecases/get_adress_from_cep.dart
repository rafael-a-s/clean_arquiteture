import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/adress.dart';
import 'package:my_app/features/domain/repositories/i_address_repository.dart';

class GetAdressFromCep implements Usecase<Adress, String> {

  late final IAdressRepository repository;

  GetAdressFromCep(this.repository);

  @override
  Future<Either<Failure, Adress>> call(String? cep) async {
   return cep != null ? await repository.getUserGitFormUsername(cep) : Left(NullParamFailure());
  }

}
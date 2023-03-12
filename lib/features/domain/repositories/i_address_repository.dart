import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/adress.dart';

abstract class IAdressRepository {
  Future<Either<Failure, Adress>> getUserGitFormUsername(String cep);
}
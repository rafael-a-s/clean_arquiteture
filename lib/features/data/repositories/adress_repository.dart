import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/data/datasources/example/adress/i_adress_datasource.dart';
import 'package:my_app/features/domain/entities/adress.dart';
import 'package:my_app/features/domain/repositories/i_address_repository.dart';

class AdressRespository extends IAdressRepository {

  late final IAdressDataSoure datasource;

  AdressRespository(this.datasource);

  @override
  Future<Either<Failure, Adress>> getUserGitFormUsername(String cep) async {
    try {
      final result = await datasource.getAdressFromCep(cep);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  
}
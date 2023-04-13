import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/repositories/i_coin_repository.dart';

class GetAllCoin implements Usecase<List<Coin>, NoParams> {
  late final ICoinRepository repository;

  GetAllCoin(this.repository);

  @override
  Future<Either<Failure, List<Coin>>> call(NoParams) async {
    final result = await repository.getAllCoin();
    return result;
  }
}

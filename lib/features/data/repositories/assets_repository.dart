import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/assets/assets_datasource.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/repositories/i_assets_repository.dart';

class AssetsRepository implements IAssetsRepository {
  late final AssetsDataSource dataSource;

  AssetsRepository(this.dataSource);

  @override
  Future<Either<Failure, List<Assets>>> getAllAssetsRecets() async {
    try {
      final result = await dataSource.getAllAssetsRecets();
      return Right(result
          .map((asset) => Assets(
                symbol: asset.symbol,
                quanty: asset.quanty,
                price: asset.price,
              ))
          .toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

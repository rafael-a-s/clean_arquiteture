import 'package:my_app/core/data/repositories/i_base_repository.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';

abstract class IPortifolioRepoitory
    extends IBaseRepository<Portifolio, PortifolioModel, dynamic> {
  Future<Either<Failure, PortifolioInfo>> getInfoPortifolio();
  Future<Either<Failure, Portifolio>> addAssetPortifolio(
    String id,
    Assets asset,
  );
}

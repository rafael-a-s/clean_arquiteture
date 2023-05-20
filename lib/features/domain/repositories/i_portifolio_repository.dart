import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';

abstract class IPortifolioRepoitory {
  Future<Either<Failure, List<Portifolio>>> getAllPortifolios();
  Future<Either<Failure, PortifolioInfo>> getInfoPortifolio();
  Future<Either<Failure, Portifolio>> createPortifolio(Portifolio assets);
  Future<Either<Failure, Portifolio>> addAssetPortifolio(
    String id,
    Assets asset,
  );
}

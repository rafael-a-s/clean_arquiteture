import 'package:my_app/core/data/datasources/i_base_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/data/models/portifolio/portifolio_info_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';

abstract class IPortifolioDataSource
    extends IBaseDatasource<PortifolioModel, dynamic> {
  IPortifolioDataSource({required super.api});

  Future<PortifolioInfoModel> getInfoAboutPortifolio();
  Future<PortifolioModel> addAssetPortifolio(String id, AssetsModel asset);
}

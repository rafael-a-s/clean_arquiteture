import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/data/models/portifolio/portifolio_info_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';

abstract class IPortifolioDataSource {
  Future<List<PortifolioModel>> getAllPortifolios();
  Future<PortifolioInfoModel> getInfoAboutPortifolio();
  Future<PortifolioModel> createPortifolio(PortifolioModel assets);
  Future<PortifolioModel> addAssetPortifolio(String id, AssetsModel asset);
}

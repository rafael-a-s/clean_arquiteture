import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/domain/entities/assets.dart';

abstract class IAssetsDataSource {
  Future<List<AssetsModel>> getAllAssetsRecets();
}

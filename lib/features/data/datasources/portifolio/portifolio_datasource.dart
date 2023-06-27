import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:my_app/core/data/datasources/base_datasource.dart';
import 'package:my_app/core/domain/base_json_convert.dart';
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/portifolio/i_portifolio_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/data/models/portifolio/portifolio_info_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';

class PortifolioDataSource extends BaseDatasource<PortifolioModel, dynamic>
    implements IPortifolioDataSource {
  final JsonModelConvert<PortifolioModel> jsonConvert =
      JsonModelConvert<PortifolioModel>(
    fromJson: (data) => PortifolioModel.fromJson(data),
    toJson: (convert) =>
        convert.id == null ? convert.toJsonCrate() : convert.toJson(),
  );

  PortifolioDataSource({
    required super.client,
    required super.api,
  });

  @override
  Future<PortifolioModel> addAssetPortifolio(
      String id, AssetsModel asset) async {
    final body = asset.toJson();
    final response = await client.patch(
      '',
      data: jsonEncode(body),
    );

    return response.statusCode == 200
        ? PortifolioModel.fromJson(json.decode(response.data))
        : throw ServerException();
  }

  @override
  Future<PortifolioInfoModel> getInfoAboutPortifolio() async {
    try {
      final response = await client.get('$api/infos-general');
      final data = response.data;

      return PortifolioInfoModel.fromJson(data);
    } on DioException catch (e) {
      throw DioException(requestOptions: RequestOptions(), error: e.error);
    }
  }

  @override
  JsonModelConvert<PortifolioModel> getJsonConvert() {
    return jsonConvert;
  }
}

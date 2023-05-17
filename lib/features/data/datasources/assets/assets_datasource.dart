import 'dart:convert';

import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/assets/i_assets_datasource.dart';
import 'package:my_app/features/data/datasources/endpoints/assets_endpoints.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:http/http.dart' as http;

class AssetsDataSource implements IAssetsDataSource {
  final http.Client client;

  AssetsDataSource({
    required this.client,
  });

  @override
  Future<List<AssetsModel>> getAllAssetsRecets() async {
    final response = await http.Client().get(
      AssetsEndPoints.getAllAssetsRecets(),
    );

    late List<dynamic> jsonResponse;

    response.statusCode == 200
        ? jsonResponse = json.decode(response.body)
        : throw ServerException();

    return jsonResponse.map((asset) => AssetsModel.fromJson(asset)).toList();
  }
}

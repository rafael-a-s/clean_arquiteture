import 'dart:convert';

import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/endpoints/portifolio_endpoints.dart';
import 'package:my_app/features/data/datasources/portifolio/i_portifolio_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/data/models/portifolio_model.dart';
import 'package:pocketbase/pocketbase.dart';

class PortifolioDataSource implements IPortifolioDataSource {
  final http.Client client;

  PortifolioDataSource({
    required this.client,
  });

  @override
  Future<List<PortifolioModel>> getAllPortifolios() async {
    final response = await client.get(PortifolioEndPoints.getAllPortifolios());

    late dynamic jsonResponse;

    response.statusCode == 200
        ? jsonResponse = json.decode(response.body)
        : throw ServerException();
    final items = jsonResponse['items'] as List;

    return items.map((value) => PortifolioModel.fromJson(value)).toList();
  }

  @override
  Future<PortifolioModel> createPortifolio(PortifolioModel portifolio) async {
    final body = portifolio.toJson();
    final response = await client.post(
      PortifolioEndPoints.createPortifolio(),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    return response.statusCode == 200
        ? PortifolioModel.fromJson(json.decode(response.body))
        : throw ServerException();
  }
}

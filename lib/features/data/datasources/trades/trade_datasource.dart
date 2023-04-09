import 'dart:convert';

import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/endpoints/trade_endpoints.dart';
import 'package:my_app/features/data/datasources/trades/i_trade_datasource.dart';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

class TradeDataSource implements ITradeDataSource {
  final http.Client client;
  final pb = PocketBase('http://127.0.0.1:8090');

  TradeDataSource({
    required this.client,
  });

  @override
  Future<AssetsModel> getAllTrades() async {
    final response = await client.get(TradeEndPoints.getAllTrades());

    return response.statusCode == 200
        ? AssetsModel.fromJson(json.decode(response.body))
        : throw ServerException();
  }

  @override
  Future<AssetsModel> createTrade(AssetsModel assets) async {
    final body = assets.toJson();
    final response = await client.post(
      TradeEndPoints.createTrade(),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    return response.statusCode == 200
        ? AssetsModel.fromJson(json.decode(response.body))
        : throw ServerException();
  }
}

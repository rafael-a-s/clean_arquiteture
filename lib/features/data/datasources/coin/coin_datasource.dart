import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_app/features/data/datasources/endpoints/bn_endpoints.dart';
import 'package:my_app/features/data/datasources/coin/i_coin_datasource.dart';
import 'package:my_app/features/data/models/coin_model.dart';
import 'package:my_app/features/data/models/portifolio_model.dart';
import '../../../../core/usecase/erros/exceptions.dart';

class CoinDataSource implements ICoinDataSource {
  final http.Client client;

  CoinDataSource({
    required this.client,
  });

  @override
  Future<CoinModel> getCoinSymbol(String symbol) async {
    final response = await client.get(BnEndPoints.getCoinSymbol(symbol));

    return response.statusCode == 200
        ? CoinModel.fromJson(json.decode(response.body))
        : throw ServerException();
  }

  @override
  Future<List<CoinModel>> getAllSymbol() async {
    final response = await client.get(BnEndPoints.getAllSymbol());

    late List<dynamic> jsonResponse;
    response.statusCode == 200
        ? jsonResponse = json.decode(response.body)
        : throw ServerException();

    return jsonResponse.map((coin) => CoinModel.fromJson(coin)).toList();
  }
}

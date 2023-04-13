import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class BnEndPoints {
  static final String _baseUrl = dotenv.env['URL'].toString();
  static const String _charactersPath = '/api/v3/ticker/price';

  static Uri getAllSymbol() => Uri.https(_baseUrl, _charactersPath);

  static Uri getCoinSymbol(String symbol) {
    final Map<String, String> queryParameters = <String, String>{
      'symbol': symbol,
    };
    return Uri.https(_baseUrl, _charactersPath, queryParameters);
  }
}

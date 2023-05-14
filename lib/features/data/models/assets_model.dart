import 'package:my_app/features/domain/entities/assets.dart';

class AssetsModel extends Assets {
  const AssetsModel({
    String? id,
    required String symbol,
    required double quanty,
    required double price,
  }) : super(
          id: id,
          symbol: symbol,
          quanty: quanty,
          price: price,
        );

  factory AssetsModel.fromJson(Map<String, dynamic> json) => AssetsModel(
        id: json['id'],
        symbol: json['symbol'],
        quanty: (json['quanty'] as num).toDouble(),
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'quanty': quanty,
        'price': price,
      };
}

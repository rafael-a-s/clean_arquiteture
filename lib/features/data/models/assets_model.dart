import 'package:my_app/features/domain/entities/assets.dart';

class AssetsModel extends Assets {
  const AssetsModel({
    String? id,
    required String symbol,
    required double amount,
    required double price,
  }) : super(
          id: id,
          symbol: symbol,
          amount: amount,
          price: price,
        );

  factory AssetsModel.fromJson(Map<String, dynamic> json) => AssetsModel(
        id: json['id'],
        symbol: json['symbol'],
        amount: (json['amount'] as num).toDouble(),
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'amount': amount,
        'price': price,
      };
}

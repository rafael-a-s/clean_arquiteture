import 'dart:ffi';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';

class PortifolioModel extends Portifolio {
  const PortifolioModel({
    String? id,
    required String name,
    required String coin,
    required double subTotal,
    required double totalPriceActual,
    required double percent,
    required List<AssetsModel> assets,
  }) : super(
          id: id,
          name: name,
          coin: coin,
          subTotal: subTotal,
          totalPriceActual: totalPriceActual,
          percent: percent,
          assets: assets,
        );

  factory PortifolioModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> assetsJson = json['assets'];
    List<AssetsModel> assets =
        assetsJson.map((value) => AssetsModel.fromJson(value)).toList();
    return PortifolioModel(
      id: json['id'],
      name: json['name'],
      coin: json['coin'],
      subTotal: double.parse(json['subTotal'].toString()),
      totalPriceActual: double.parse(json['totalPriceActual'].toString()),
      percent: double.parse(json['percent'].toString()),
      assets: assets,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coin': coin,
        'subTotal': subTotal,
        'totalPriceActual': totalPriceActual,
        'percent': percent,
        'assets': assets,
      };

  Map<String, dynamic> toJsonCrate() => {
        'name': name,
        'coin': coin,
        'assets': assets,
      };
}

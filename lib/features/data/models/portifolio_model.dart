import 'dart:ffi';
import 'package:my_app/features/data/models/assets_model.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';

class PortifolioModel extends Portifolio {
  const PortifolioModel({
    String? id,
    required String name,
    required Double subTotal,
    required Double totalPriceActual,
    required Double percent,
    required List<AssetsModel> assets,
  }) : super(
          id: id,
          name: name,
          subTotal: subTotal,
          totalPriceActual: totalPriceActual,
          percent: percent,
          assets: assets,
        );

  factory PortifolioModel.fromJson(Map<String, dynamic> json) =>
      PortifolioModel(
        id: json['id'],
        name: json['name'],
        subTotal: json['subTotal'],
        totalPriceActual: json['totalPriceActual'],
        percent: json['percent'],
        assets: json['assets'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'subTotal': subTotal,
        'totalPriceActual': totalPriceActual,
        'percent': percent,
        'assets': assets,
      };
}

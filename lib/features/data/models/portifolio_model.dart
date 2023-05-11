import 'dart:ffi';
import 'package:my_app/features/domain/entities/portifolio.dart';

class PortifolioModel extends Portifolio {
  const PortifolioModel({
    this.id,
    required this.name,
    required this.subTotal,
    required this.totalPriceActual,
    required this.percent,
    required this.assets,

  }) : super(
          id: id,
          name: name,
          subTotal: subTotal,
          totalPriceActual: totalPriceActual,
          percent: percent,
          assets: assets,
        );

  factory PortifolioModel.fromJson(Map<String, dynamic> json) => PortifolioModel(
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

import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:my_app/features/domain/entities/assets.dart';

class Portifolio extends Equatable {
  final String? id;
  final String name;
  final String coin;
  final double subTotal;
  final double totalPriceActual;
  final double percent;
  final List<Assets> assets;

  const Portifolio({
    this.id,
    required this.name,
    required this.coin,
    required this.subTotal,
    required this.totalPriceActual,
    required this.percent,
    required this.assets,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        coin,
        subTotal,
        totalPriceActual,
        percent,
        assets,
      ];
}

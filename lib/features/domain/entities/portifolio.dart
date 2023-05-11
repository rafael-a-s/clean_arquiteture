import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:my_app/features/domain/entities/assets.dart';

class Portifolio extends Equatable {
  final String? id;
  final String name;
  final Double subTotal;
  final Double totalPriceActual;
  final Double percent;
  final Assets assets;

  const Portifolio({
    this.id,
    required this.name,
    required this.subTotal,
    required this.totalPriceActual,
    required this.percent,
    required this.assets,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        subTotal,
        totalPriceActual,
        percent,
        assets,
      ];
}

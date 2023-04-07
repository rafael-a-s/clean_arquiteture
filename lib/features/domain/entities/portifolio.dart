import 'dart:ffi';
import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String symbol;
  final double price;

  const Coin({
    required this.symbol,
    required this.price,
  });

  @override
  List<Object?> get props => [
        symbol,
        price,
      ];
}

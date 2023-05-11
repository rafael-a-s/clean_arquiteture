import 'package:equatable/equatable.dart';

class Assets extends Equatable {
  final String? id;
  final String symbol;
  final double quanty;
  final double price;

  const Assets({
    this.id,
    required this.symbol,
    required this.quanty,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        quanty,
        price,
      ];
}

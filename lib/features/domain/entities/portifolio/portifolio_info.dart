import 'dart:ffi';
import 'package:equatable/equatable.dart';

class PortifolioInfo extends Equatable {
  final double total;
  final double totalUpdated;
  final double pnl;
  final double percent;

  const PortifolioInfo({
    required this.total,
    required this.totalUpdated,
    required this.pnl,
    required this.percent,
  });

  List<Object?> get props => [
        total,
        totalUpdated,
        pnl,
        percent,
      ];
}

import 'dart:ffi';
import 'package:equatable/equatable.dart';

class PortifolioInfo extends Equatable {
  final String total;
  final String totalUpdated;
  final String pnl;
  final String percent;

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

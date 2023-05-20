import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';

class PortifolioInfoModel extends PortifolioInfo {
  const PortifolioInfoModel({
    required double total,
    required double totalUpdated,
    required double pnl,
    required double percent,
  }) : super(
          total: total,
          totalUpdated: totalUpdated,
          pnl: pnl,
          percent: percent,
        );

  factory PortifolioInfoModel.fromJson(Map<String, dynamic> json) {
    return PortifolioInfoModel(
      total: double.parse(json['total']),
      totalUpdated: double.parse(json['totalUpdated']),
      pnl: double.parse(json['pnl']),
      percent: double.parse(json['pnl']),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalUpdated': totalUpdated,
        'pnl': pnl,
        'percent': percent,
      };
}

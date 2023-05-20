import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';

class PortifolioInfoModel extends PortifolioInfo {
  const PortifolioInfoModel({
    required String total,
    required String totalUpdated,
    required String pnl,
    required String percent,
  }) : super(
          total: total,
          totalUpdated: totalUpdated,
          pnl: pnl,
          percent: percent,
        );

  factory PortifolioInfoModel.fromJson(Map<String, dynamic> json) {
    return PortifolioInfoModel(
      total: json['total'],
      totalUpdated: json['totalUpdated'],
      pnl: json['pnl'],
      percent: json['percent'],
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalUpdated': totalUpdated,
        'pnl': pnl,
        'percent': percent,
      };
}

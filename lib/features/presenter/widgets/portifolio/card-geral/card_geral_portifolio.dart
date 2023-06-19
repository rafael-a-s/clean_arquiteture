import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/presenter/controllers/portifolio/geral_page_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardGeralPortifolio extends StatefulWidget {
  PortifolioInfo info;
  CardGeralPortifolio({
    required this.info,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CardGeralPortifolio();
}

class _CardGeralPortifolio extends State<CardGeralPortifolio> {
  final store = Modular.get<GeralPageStore>();

  late PortifolioInfo infoPortifolio;

  dynamic color;

  final formatCurrency = NumberFormat.simpleCurrency(
    locale: "en_US",
    decimalDigits: 2,
  );
  bool _isLoading = false;

  Future<void> _fetchInfoAboutPortifolios() async {
    _isLoading = true;
    final result = await store.getInfoAboutPortifolio();
    setState(() {
      infoPortifolio = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchInfoAboutPortifolios();
    color = widget.info.pnl > 0 ? RootStyle.winerColor : RootStyle.lossColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(RootStyle.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Saldo total da carteira',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(RootStyle.ptColor),
                ),
              ),
              Text(
                formatCurrency.format(widget.info.totalUpdated),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(RootStyle.ptColor),
                ),
              ),
              const Text(
                'Pnl geral',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(RootStyle.stColor),
                ),
              ),
              Text(
                formatCurrency.format(widget.info.pnl),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(color),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'USD',
                    style: TextStyle(
                      color: Color(RootStyle.ptColor),
                    ),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: Color(RootStyle.ptColor),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/svg/graph.svg",
                width: 60,
                height: 60,
                color: Color(color),
              )
            ],
          ),
        ],
      ),
    );
  }
}

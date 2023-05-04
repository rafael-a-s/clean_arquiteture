import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/features/presenter/root.dart';

class CardPortifolio extends StatefulWidget {
  double total = 0.0;

  CardPortifolio({
    super.key,
    required this.total,
  });

  @override
  State<StatefulWidget> createState() => _CardPortifolio();
}

class _CardPortifolio extends State<CardPortifolio> {
  @override
  void didUpdateWidget(covariant CardPortifolio oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(
          RootStyle.primaryColor,
        ),
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
                '\$ ${widget.total.toStringAsFixed(6)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(RootStyle.ptColor),
                ),
              ),
              const Text(
                'Perfil este mês',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(RootStyle.ptColor),
                ),
              ),
              const Text(
                '\$25.09 +10%',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 255, 8),
                ),
              ),
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
                color: Color.fromARGB(255, 62, 146, 64),
              )
            ],
          ),
        ],
      ),
    );
  }
}

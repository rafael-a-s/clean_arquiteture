import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCard extends StatefulWidget {
  final Coin coin;
  const ListCard({
    super.key,
    required this.coin,
  });

  @override
  State<StatefulWidget> createState() => _ListCard();
}

class _ListCard extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(
          RootStyle.secondColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.coin.symbol),
              Text(
                '\$ ${widget.coin.price.toStringAsFixed(6)}',
                style: TextStyle(
                  color: Colors.green.shade400,
                ),
              ),
              IconButton(
                onPressed: () => {
                  Modular.to.navigate('/new-trade', arguments: widget.coin),
                },
                icon: const Icon(
                  Icons.chevron_right,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

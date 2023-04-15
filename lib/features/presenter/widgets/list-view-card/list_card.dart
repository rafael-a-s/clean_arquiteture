import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.coin.symbol),
            IconButton(
              onPressed: () => {
                Modular.to.navigate('/new-trade', arguments: widget.coin),
              },
              icon: const Icon(Icons.chevron_right),
            )
          ],
        ),
        const Divider(
          color: Color(RootStyle.bgColor),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/presenter/root.dart';

class ListCardPortifolio extends StatefulWidget {
  final Assets assets;

  const ListCardPortifolio({
    super.key,
    required this.assets,
  });

  @override
  State<StatefulWidget> createState() => _ListCardPortifolio();
}

class _ListCardPortifolio extends State<ListCardPortifolio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(
        top: 15,
      ),
      decoration: const BoxDecoration(
        color: Color(
          RootStyle.secondColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/coin.svg",
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text(widget.assets.symbol),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.assets.quanty.toString(),
                    style: const TextStyle(
                      color: Color(
                        RootStyle.stColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '\$${widget.assets.price}',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

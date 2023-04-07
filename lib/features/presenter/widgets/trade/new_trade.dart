import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/trade_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Trade extends StatefulWidget {
  const Trade({super.key});

  @override
  State<StatefulWidget> createState() => _Trade();
}

class _Trade extends State<Trade> {
  final store = Modular.get<TradeStore>();
  var coin = const Coin(symbol: '', price: 0.0);

  final _symbol = TextEditingController();
  final _price = TextEditingController();

  Future<void> _loadCoin(String symbol) async {
    final result = await store.getCoinSymbol(symbol);

    setState(() {
      coin = result;
      _price.text = coin.price.toStringAsFixed(9);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      height: double.maxFinite,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color(RootStyle.secondColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            'Adicione uma nova transação',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _symbol,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Symbol'),
                    hintText: 'BTC',
                    suffix: const Text('USDT'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () => _loadCoin(_symbol.text),
                icon: const Icon(Icons.search),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _price,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Preço'),
                    hintText: 'Preço',
                    suffix: const Text('\$'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Quantidade'),
                    hintText: '0 - 9999',
                    suffix: const Text('UN'),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(RootStyle.bgColor),
              minimumSize: const Size(100, 50),
            ),
            onPressed: () => {},
            child: const Text('Adicionar Transação'),
          )
        ],
      ),
    );
  }
}

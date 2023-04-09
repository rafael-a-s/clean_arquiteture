import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
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
  var trade = const Assets(symbol: '', amount: 0.0, price: 0.0);

  final _formKey = GlobalKey<FormState>();
  final _symbol = TextEditingController();
  final _price = TextEditingController();
  final _amount = TextEditingController();

  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  Future<void> _loadCoin(String symbol) async {
    final result = await store.getCoinSymbol(symbol);

    setState(() {
      coin = result;
      trade = Assets(
        symbol: coin.symbol,
        amount: 0.0,
        price: 0.0,
      );
      _price.text = coin.price.toStringAsFixed(9);
    });
  }

  Future<bool> _addTransactional(double? p, double? a) async {
    trade = Assets(symbol: trade.symbol, amount: a!, price: p!);

    Assets result = await store.createTrade(trade);

    return result.id == null ? false : true;
  }

  void showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Transação Efetuada com sucesso"),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Modular.to.navigate('/'), child: Text("Ok"))
        ],
      ),
    );
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
      child: Form(
        key: _formKey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return INVALID_LABEL;
                      }
                      return null;
                    },
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text('Moeda'),
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
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return INVALID_LABEL;
                      }
                      return null;
                    },
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
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return INVALID_LABEL;
                      }
                      return null;
                    },
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
              onPressed: () async => {
                if (_formKey.currentState!.validate())
                  {
                    _addTransactional(
                      double.tryParse(_price.text),
                      double.tryParse(_amount.text.toString()),
                    ).then(
                      (value) => value ? showSuccessMessage(context) : false,
                    )
                  }
              },
              child: const Text('Adicionar Transação'),
            )
          ],
        ),
      ),
    );
  }
}

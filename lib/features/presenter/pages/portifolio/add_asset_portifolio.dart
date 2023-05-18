import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/portifolio/add_asset_store.dart';
import 'package:my_app/features/presenter/controllers/trade_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/snack-bar/snack-bar.dart';

class AddNewAssetPortifolioPage extends StatefulWidget {
  final Portifolio portifolio;
  const AddNewAssetPortifolioPage({super.key, required this.portifolio});

  @override
  State<StatefulWidget> createState() => _AddNewAssetPortifolioPage();
}

class _AddNewAssetPortifolioPage extends State<AddNewAssetPortifolioPage> {
  final store = Modular.get<AddAssetStore>();
  var coin = const Coin(symbol: '', price: 0.0);
  late Portifolio portifolioUpdated;
  Timer? _timer;

  final _formKey = GlobalKey<FormState>();
  final _price = TextEditingController();
  final _quanty = TextEditingController();

  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  Future _fetchCoin() async {
    final result = await store.getCoinSymbol(widget.portifolio.coin);
    setState(() {
      coin = result;
      _price.text = coin.price.toStringAsFixed(9);
    });
  }

  @override
  void initState() {
    super.initState();
    _quanty.text = '0';
    _fetchCoin();
  }

  Future<bool> _addAssetPortifolio(String id, Assets asset) async {
    Portifolio result = await store.addAsset(id, asset);
    portifolioUpdated = result;
    return result.id == null ? false : true;
  }

  void showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: SnackBarFlash(
          title: 'Sucesso',
          description: 'Sua transação foi salva com sucesso em seu portifolio.',
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
    Modular.to.navigate(
      '/portifolio',
      arguments: portifolioUpdated,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Modular.to.navigate(
                        '/portifolio',
                        arguments: widget.portifolio,
                      );
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Adicione uma nova transação',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: _quanty,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return INVALID_LABEL;
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffix: Text(
                        widget.portifolio.coin,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    onChanged: (value) => {
                      if (_timer?.isActive ?? false) _timer?.cancel(),
                      _timer = Timer(const Duration(milliseconds: 800), () {
                        if (_quanty.text.isEmpty) _quanty.text = '0';
                      })
                    },
                  ),
                ),
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
                      label: const Text('Preço por moeda'),
                      hintText: 'Preço',
                      suffix: const Text('\$'),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll<Size?>(
                  Size(double.infinity, 50),
                ),
                backgroundColor: MaterialStatePropertyAll<Color?>(
                  Color(RootStyle.primaryColor),
                ),
              ),
              onPressed: () async => {
                if (_formKey.currentState!.validate())
                  {
                    _addAssetPortifolio(
                      widget.portifolio.id!,
                      Assets(
                        symbol: coin.symbol,
                        quanty: double.parse(_quanty.text),
                        price: double.parse(_price.text),
                      ),
                    ).then(
                      (value) => value ? showSuccessMessage(context) : false,
                    )
                  },
              },
              child: const Text(
                'Adicionar Transação',
                style: TextStyle(
                  color: Color(RootStyle.ptColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/create_portifolio.dart';
import 'package:my_app/features/presenter/controllers/list_coin_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/snack-bar/snack-bar.dart';

class CreatePortifolio extends StatefulWidget {
  const CreatePortifolio({super.key});

  @override
  State<CreatePortifolio> createState() => _CreatePortifolioState();
}

class _CreatePortifolioState extends State<CreatePortifolio> {
  final listCoinStore = Modular.get<ListCoinStore>();
  final createStore = Modular.get<CreatePortifolioStore>();
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _asset = TextEditingController();
  final _quanty = TextEditingController();
  final _price = TextEditingController();
  bool _isFieldEnabled = false;

  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  late List<Coin> _list;
  List<Coin> _filtered = [];
  bool _isLoading = false;
  Timer? _timer;

  Future<void> _fetchCoins() async {
    _isLoading = true;
    final result = await listCoinStore.getAllCoinSymbol();
    setState(() {
      _list = result;
      _filtered =
          _list.where((e) => e.symbol.toUpperCase().contains('USDT')).toList();
      _isLoading = false;
    });
  }

  Future<bool> _createPortifolio() async {
    _isLoading = true;
    Portifolio result = await createStore.createTrade(
      Portifolio(
        name: _name.text,
        coin: _asset.text,
        subTotal: 0,
        totalPriceActual: 0,
        percent: 0,
        assets: [
          Assets(
            symbol: _asset.text,
            quanty: double.parse(_quanty.text),
            price: double.parse(_price.text),
          ),
        ],
      ),
    );
    _isLoading = false;
    print(result.id);

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
    Modular.to.navigate('/');
  }

  @override
  void initState() {
    super.initState();
    _quanty.text = '0';
    _fetchCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      height: double.maxFinite,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color(RootStyle.bgColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Crie seu portifolio',
              style: RootStyle.title1Style,
            ),
            TextFormField(
              controller: _name,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                label: const Text('Nome *'),
                suffix: const Text('abc'),
              ),
            ),
            const Text(
              'Selecione uma moeda, e crie seu portifolio',
              style: RootStyle.title3Style,
            ),
            Row(
              children: [
                Expanded(
                  child: Autocomplete<Coin>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Coin>.empty();
                      }
                      return _filtered
                          .where((Coin coin) => coin.symbol
                              .toLowerCase()
                              .startsWith(textEditingValue.text.toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (Coin coin) => coin.symbol,
                    onSelected: (coin) {
                      _price.text = coin.price.toStringAsFixed(9);
                      _asset.text = coin.symbol;
                      setState(() {
                        _isFieldEnabled = true;
                      });
                    },
                  ),
                ),
                const Icon(Icons.search)
              ],
            ),
            TextFormField(
              controller: _quanty,
              keyboardType: TextInputType.number,
              enabled: _isFieldEnabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                label: const Text('Quantidade'),
                suffix: const Text('123'),
                suffixIcon: Container(
                  height: 56, // Altura do TextFormField padrão
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward),
                          iconSize: 15, // Tamanho do ícone
                          onPressed: () {
                            setState(() {
                              var value = double.parse(_quanty.text);
                              _quanty.text = (value + 1).toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 15, // Tamanho do ícone
                          onPressed: () {
                            setState(() {
                              var value = double.parse(_quanty.text);
                              value > 0
                                  ? _quanty.text = (value - 1).toString()
                                  : '0';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: _price,
              keyboardType: TextInputType.number,
              enabled: _isFieldEnabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                label: const Text('Preço'),
                suffix: const Text('\$'),
              ),
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
                    _createPortifolio().then(
                      (value) => value ? showSuccessMessage(context) : false,
                    )
                  }
              },
              child: const Text(
                'Criar Portifolio',
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

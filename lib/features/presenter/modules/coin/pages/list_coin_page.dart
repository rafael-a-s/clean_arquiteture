import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/presenter/modules/coin/controller/coin_controller.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/list-view-card/list_card.dart';

class ListCoinPage extends StatefulWidget {
  const ListCoinPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListCoinPage();
}

class _ListCoinPage extends State<ListCoinPage> {
  final store = Modular.get<CoinController>();
  final _search = TextEditingController();
  late List<Coin> _list;
  List<Coin> _filtered = [];
  bool _isLoading = false;
  Timer? _timer;

  Future<void> _fetchCoins() async {
    _isLoading = true;
    final result = await store.getAllCoinSymbol();
    setState(() {
      _list = result;
      _filtered =
          _list.where((e) => e.symbol.toUpperCase().contains('USDT')).toList();
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 15, left: 15, right: 15),
      height: double.maxFinite,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color(RootStyle.bgColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _search,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(RootStyle.secondColor),
              labelStyle: const TextStyle(
                color: Color(RootStyle.stColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(
                    RootStyle.secondColor,
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(RootStyle.stColor),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              label: const Text('Pesquise'),
              hintText: 'BTCUSDT',
              suffix: const Icon(Icons.paid),
            ),
            onChanged: (value) => {
              if (_timer?.isActive ?? false) _timer?.cancel(),
              _timer = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  _filtered = _list
                      .where((coin) => coin.symbol
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .where(
                          (coin) => coin.symbol.toUpperCase().contains('USDT'))
                      .toList();
                });
              }),
            },
          ),
          const SizedBox(
            height: 15,
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: _filtered.isNotEmpty
                      ? ListView.builder(
                          itemCount: _filtered.length,
                          itemBuilder: (context, item) {
                            return ListCard(
                              coin: _filtered[item],
                            );
                          },
                        )
                      : const Center(
                          child: Text('Sem resultados encontrados.'),
                        ),
                ),
        ],
      ),
    );
  }
}

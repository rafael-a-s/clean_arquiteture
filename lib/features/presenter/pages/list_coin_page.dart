import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/list_coin_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/list-view-card/list_card.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCoinPage extends StatefulWidget {
  const ListCoinPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListCoinPage();
}

class _ListCoinPage extends State<ListCoinPage> {
  final store = Modular.get<ListCoinStore>();
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
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Color.fromARGB(255, 163, 157, 157),
                ),
                borderRadius: BorderRadius.circular(50.0),
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

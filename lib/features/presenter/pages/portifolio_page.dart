import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/presenter/controllers/list_portifolio_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/portifolio/card-portifolio/card_portifolio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/portifolio/list-portifolio/list_card.dart';

class PortifolioPage extends StatefulWidget {
  const PortifolioPage({super.key});

  @override
  State<StatefulWidget> createState() => _PortifolioPage();
}

class _PortifolioPage extends State<PortifolioPage> {
  final store = Modular.get<ListPortifolioStore>();
  late List<Assets> _list;
  bool _isLoading = false;
  double total = 0.0;

  Future<void> _fetchTrades() async {
    _isLoading = true;
    final result = await store.getAllTrade();
    setState(() {
      _list = result;
      _list.forEach((e) => total += e.price * e.amount);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchTrades();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: double.maxFinite,
      child: Column(
        children: [
          const Text(
            'Portifolio',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CardPortifolio(total: total),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Carteira',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {Modular.to.navigate('/list-coin')},
                    icon: const Icon(
                      Icons.add,
                    ),
                    hoverColor: const Color(RootStyle.bgColor),
                  ),
                  const Text('Adicionar Trade')
                ],
              )
            ],
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: _list.isNotEmpty
                      ? ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (context, item) {
                            ListCardPortifolio list = ListCardPortifolio(
                              assets: _list[item],
                            );
                            return list;
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

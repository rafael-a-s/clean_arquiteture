import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/list_portifolio_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/appbar/app_bar.dart';
import 'package:my_app/features/presenter/widgets/home/botton-navigation/bottom_navigation.dart';
import 'package:my_app/features/presenter/widgets/home/box-decoration/box_decoration_home.dart';
import 'package:my_app/features/presenter/widgets/home/container-card/container_card.dart';
import 'package:my_app/features/presenter/widgets/home/graph/graph.dart';
import 'package:my_app/features/presenter/widgets/home/mini-cards/mini_card.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/home/plus-portifolio/plus_portifolio.dart';
import 'package:my_app/features/presenter/widgets/portifolio/list-portifolio/list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  final storeTransaction = Modular.get<ListPortifolioStore>();
  var _isLoading = false;
  double total = 0.0;
  late List<Assets> _list;

  Future<void> _fetchTrades() async {
    _isLoading = true;
    final result = await storeTransaction.getAllTrade();
    setState(() {
      _list = result;
      _list.forEach((e) => total += e.price * e.quanty);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _list = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppBarDefault(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: ContainerCard(),
              ),
              SizedBox(width: 15),
              PlusPortifolio()
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Transações recentes',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(RootStyle.ptColor),
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
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

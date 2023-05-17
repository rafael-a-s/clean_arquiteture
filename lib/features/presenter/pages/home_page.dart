import 'package:flutter/material.dart';
import 'package:my_app/core/usecase/usecase.dart';
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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  var _isLoading = false;
  late List<Assets> _listAssets;
  late List<Portifolio> _listPortifolio;

  Future _fetchs() async {
    _isLoading = true;
    final resultAssets = await store.getAllAssetsRecents();
    final resultPortifolios = await store.getAllPortifolio();
    setState(() {
      _listPortifolio = resultPortifolios;
      _listAssets = resultAssets;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchs();
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
            children: [
              SizedBox(
                height: 200,
                width: 335,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _listPortifolio.isEmpty
                        ? const Center(
                            child: Text('Sem portifolio no momento'),
                          )
                        : ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _listPortifolio.length,
                            itemBuilder: (context, item) {
                              return GestureDetector(
                                onTap: () {
                                  Modular.to.navigate(
                                    '/portifolio',
                                    arguments: _listPortifolio[item],
                                  );
                                },
                                child: ContainerCard(
                                  portifolio: _listPortifolio[item],
                                ),
                              );
                            },
                          ),
              ),
              const PlusPortifolio()
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
                  child: _listAssets.isNotEmpty
                      ? ListView.builder(
                          itemCount: _listAssets.length,
                          itemBuilder: (context, item) {
                            ListCardPortifolio list = ListCardPortifolio(
                              assets: _listAssets[item],
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

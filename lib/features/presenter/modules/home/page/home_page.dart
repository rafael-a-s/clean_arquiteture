import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/modules/home/controller/home_controller.dart';
import 'package:my_app/features/presenter/modules/home/widget/container-card/container_card.dart';
import 'package:my_app/features/presenter/modules/home/widget/container-card/container_card_skeleton.dart';
import 'package:my_app/features/presenter/modules/home/widget/plus-portifolio/plus_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/list-portifolio/list_card.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/list-portifolio/list_card_skeleton.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/appbar/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  var _isLoading = false;
  late List<Assets> _listAssets;
  late List<Portifolio> _listPortifolio;

  Future _fetchs() async {
    _isLoading = true;
    final resultAssets = await controller.getAllAssetsRecents();
    final resultPortifolios = await controller.getAllPortifolio();
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
                    ? const ContainerCardSkeleton()
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
                                    '/portifolio/portifolio',
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
              ? Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, item) {
                      return const ListCardPortifolioSkeleton();
                    },
                  ),
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

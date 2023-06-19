import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/domain/entities/portifolio/portifolio_info.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_infos_portifolio.dart';
import 'package:my_app/features/presenter/controllers/portifolio/geral_page_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/portifolio/card-geral/card_geral_portifolio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/portifolio/card-geral/card_geral_skeleton.dart';
import 'package:my_app/features/presenter/widgets/portifolio/graph-pizza/graph_pizza.dart';
import 'package:my_app/features/presenter/widgets/portifolio/graph-pizza/graph_pizza_skeleton.dart';

class GeralPortifolioPage extends StatefulWidget {
  const GeralPortifolioPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _GeralPortifolioPage();
}

class _GeralPortifolioPage extends State<GeralPortifolioPage> {
  final store = Modular.get<GeralPageStore>();
  late PortifolioInfo infoPortifolio;
  late List<Portifolio> portifolios;
  bool _isLoading = false;

  Future<void> _fetch() async {
    _isLoading = true;
    final listPortifolio = await store.getAllPortifolio();
    final infoPortifolios = await store.getInfoAboutPortifolio();
    setState(() {
      portifolios = listPortifolio;
      infoPortifolio = infoPortifolios;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 15,
        right: 15,
      ),
      height: double.maxFinite,
      child: Column(
        children: [
          const Text(
            'Geral',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _isLoading
              ? const SkeletonCardGeralPortifolio()
              : CardGeralPortifolio(
                  info: infoPortifolio,
                ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(
                  RootStyle.secondColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Saldos',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  _isLoading
                      ? GraphPortifolioSkeleton()
                      : GraphPortifolio(
                          portifolio: portifolios,
                          infoGeral: infoPortifolio,
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

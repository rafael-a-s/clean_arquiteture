import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(homeControllerProvider.notifier).fetch();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(homeControllerProvider.select((state) => state.isLoading));

    final portifolios =
        ref.watch(homeControllerProvider.select((state) => state.portifolios));

    final assets =
        ref.watch(homeControllerProvider.select((state) => state.assets));

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
                child: loading
                    ? const ContainerCardSkeleton()
                    : portifolios.isEmpty
                        ? const Center(
                            child: Text('Sem portifolio no momento'),
                          )
                        : ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: portifolios.length,
                            itemBuilder: (context, item) {
                              return GestureDetector(
                                onTap: () {
                                  Modular.to.navigate(
                                    '/portifolio/portifolio',
                                    arguments: portifolios[item],
                                  );
                                },
                                child: ContainerCard(
                                  portifolio: portifolios[item],
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
          loading
              ? Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, item) {
                      return const ListCardPortifolioSkeleton();
                    },
                  ),
                )
              : Expanded(
                  child: assets.isNotEmpty
                      ? ListView.builder(
                          itemCount: assets.length,
                          itemBuilder: (context, item) {
                            ListCardPortifolio list = ListCardPortifolio(
                              assets: assets[item],
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

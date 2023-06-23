import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/data/datasources/coin/coin_datasource.dart';
import 'package:my_app/features/data/datasources/portifolio/portifolio_datasource.dart';
import 'package:my_app/features/data/repositories/coin_repository.dart';
import 'package:my_app/features/data/repositories/portifolio_repository.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/add_asset_portifolio.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_infos_portifolio.dart';
import 'package:my_app/features/presenter/modules/coin/coin_module.dart';
import 'package:my_app/features/presenter/modules/coin/controller/coin_controller.dart';
import 'package:my_app/features/presenter/modules/portifolio/controller/portifolio_controller.dart';
import 'package:my_app/features/presenter/modules/portifolio/pages/add_asset_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/pages/create_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/pages/geral_page.dart';
import 'package:my_app/features/presenter/modules/portifolio/pages/portifolio_page.dart';

class PortifolioModule extends Module {
  @override
  List<Module> get imports => [
        CoinModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PortifolioDataSource(client: i())),
    Bind.lazySingleton((i) => PortifolioRepository(i())),
    Bind.lazySingleton((i) => CreatePortifolioUseCase(i())),
    Bind.lazySingleton((i) => AddAssetPortifolioUseCase(i())),
    Bind.lazySingleton((i) => GetAllPortifolioUseCase(i())),
    Bind.lazySingleton((i) => GetInfoPortifolioUseCase(i())),
    Bind.factory((i) => PortifolioController(i(), i(), i(), i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const GeralPortifolioPage(),
          transition: TransitionType.leftToRightWithFade,
        ),
        ChildRoute(
          '/portifolio',
          child: (_, __) => PortifolioPage(portifolio: __.data),
          transition: TransitionType.leftToRightWithFade,
        ),
        ChildRoute(
          '/new-portifolio',
          child: (_, __) => const CreatePortifolio(),
          transition: TransitionType.upToDown,
        ),
        ChildRoute(
          '/new-asset',
          child: (_, __) => AddNewAssetPortifolioPage(portifolio: __.data),
          transition: TransitionType.leftToRightWithFade,
        ),
      ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/utils/date_input_converter.dart';
import 'package:my_app/features/data/datasources/assets/assets_datasource.dart';
import 'package:my_app/features/data/datasources/coin/coin_datasource.dart';
import 'package:my_app/features/data/datasources/portifolio/portifolio_datasource.dart';
import 'package:my_app/features/data/repositories/assets_repository.dart';
import 'package:my_app/features/data/repositories/coin_repository.dart';
import 'package:my_app/features/data/repositories/portifolio_repository.dart';
import 'package:my_app/features/domain/usecases/assets/get_all_recents_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/domain/usecases/portifolio/add_asset_portifolio.dart';
import 'package:my_app/features/domain/usecases/portifolio/create.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_infos_portifolio.dart';
import 'package:my_app/features/presenter/controllers/create_portifolio.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/list_coin_store.dart';
import 'package:my_app/features/presenter/controllers/list_portifolio_store.dart';
import 'package:my_app/features/presenter/controllers/portifolio/add_asset_store.dart';
import 'package:my_app/features/presenter/controllers/portifolio/geral_page_store.dart';
import 'package:my_app/features/presenter/controllers/trade_store.dart';
import 'package:my_app/features/presenter/pages/about_page.dart';
import 'package:my_app/features/presenter/pages/create_portifolio.dart';
import 'package:my_app/features/presenter/pages/home_page.dart';
import 'package:my_app/features/presenter/pages/list_coin_page.dart';
import 'package:my_app/features/presenter/pages/portifolio/add_asset_portifolio.dart';
import 'package:my_app/features/presenter/pages/portifolio/geral_page.dart';
import 'package:my_app/features/presenter/pages/portifolio_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Coin
    Bind.lazySingleton((i) => CoinUseCase(i())),
    Bind.lazySingleton((i) => CoinRepository(i())),
    Bind.lazySingleton((i) => CoinDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllCoinUseCase(i())),
    //Assets
    Bind.lazySingleton((i) => AssetsRepository(i())),
    Bind.lazySingleton((i) => GetAllAssetsRecentsUseCase(i())),
    Bind.lazySingleton((i) => AssetsDataSource(client: i())),
    //Portifolio
    Bind.lazySingleton((i) => CreatePortifolioUseCase(i())),
    Bind.lazySingleton((i) => AddAssetPortifolioUseCase(i())),
    Bind.lazySingleton((i) => PortifolioRepository(i())),
    Bind.lazySingleton((i) => PortifolioDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllPortifolioUseCase(i())),
    Bind.lazySingleton((i) => GetInfoPortifolioUseCase(i())),
    //Http Client
    Bind.lazySingleton((i) => http.Client()),
    //Store
    Bind.factory((i) => HomeStore(i(), i(), i())),
    Bind.factory((i) => AddAssetStore(i(), i())),
    Bind.factory((i) => ListCoinStore(i())),
    Bind.factory((i) => ListPortifolioStore(i())),
    Bind.factory((i) => CreatePortifolioStore(i())),
    Bind.factory((i) => GeralPageStore(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomePage(),
          transition: TransitionType.scale,
        ),
        ChildRoute(
          "/list-coin",
          child: (_, __) => const ListCoinPage(),
          transition: TransitionType.downToUp,
        ),
        ChildRoute(
          '/new-asset',
          child: (_, __) => AddNewAssetPortifolioPage(portifolio: __.data),
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
          '/portifolio-geral',
          child: (_, __) => GeralPortifolioPage(),
          transition: TransitionType.leftToRightWithFade,
        ),
      ];
}

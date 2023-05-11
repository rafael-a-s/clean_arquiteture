import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/utils/date_input_converter.dart';
import 'package:my_app/features/data/datasources/coin/coin_datasource.dart';
import 'package:my_app/features/data/datasources/portifolio/portifolio_datasource.dart';
import 'package:my_app/features/data/repositories/coin_repository.dart';
import 'package:my_app/features/data/repositories/portifolio_repository.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/domain/usecases/portifolio/create.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/list_coin_store.dart';
import 'package:my_app/features/presenter/controllers/list_portifolio_store.dart';
import 'package:my_app/features/presenter/controllers/trade_store.dart';
import 'package:my_app/features/presenter/pages/about_page.dart';
import 'package:my_app/features/presenter/pages/home_page.dart';
import 'package:my_app/features/presenter/pages/list_coin_page.dart';
import 'package:my_app/features/presenter/pages/new_trade.dart';
import 'package:my_app/features/presenter/pages/portifolio_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Coin
    Bind.lazySingleton((i) => CoinUseCase(i())),
    Bind.lazySingleton((i) => CoinRepository(i())),
    Bind.lazySingleton((i) => CoinDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllCoinUseCase(i())),
    //Trade
    Bind.lazySingleton((i) => CreatePortifolioUseCase(i())),
    Bind.lazySingleton((i) => PortifolioRepository(i())),
    Bind.lazySingleton((i) => PortifolioDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllPortifolioUseCase(i())),
    //Http Client
    Bind.lazySingleton((i) => http.Client()),
    //Store
    Bind.factory((i) => HomeStore(i())),
    Bind.factory((i) => TradeStore(i(), i())),
    Bind.factory((i) => ListCoinStore(i())),
    Bind.factory((i) => ListPortifolioStore(i())),
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
          '/new-trade',
          child: (_, __) => Trade(coin: __.data),
          transition: TransitionType.leftToRightWithFade,
        ),
        ChildRoute(
          '/portifolio',
          child: (_, __) => const PortifolioPage(),
          transition: TransitionType.leftToRightWithFade,
        ),
      ];
}

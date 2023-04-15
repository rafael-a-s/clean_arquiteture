import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/utils/date_input_converter.dart';
import 'package:my_app/features/data/datasources/coin/coin_datasource.dart';
import 'package:my_app/features/data/datasources/example/example_datasource.dart';
import 'package:my_app/features/data/datasources/trades/trade_datasource.dart';
import 'package:my_app/features/data/repositories/coin_repository.dart';
import 'package:my_app/features/data/repositories/example_repository.dart';
import 'package:my_app/features/data/repositories/trade_repository.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/domain/usecases/get_example_from_username_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/domain/usecases/trade/create.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/controllers/list_coin_store.dart';
import 'package:my_app/features/presenter/controllers/trade_store.dart';
import 'package:my_app/features/presenter/pages/about_page.dart';
import 'package:my_app/features/presenter/pages/home_page.dart';
import 'package:my_app/features/presenter/pages/list_coin_page.dart';
import 'package:my_app/features/presenter/pages/new_trade.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Coin
    Bind.lazySingleton((i) => CoinUseCase(i())),
    Bind.lazySingleton((i) => CoinRepository(i())),
    Bind.lazySingleton((i) => CoinDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllCoinUseCase(i())),
    //Trade
    Bind.lazySingleton((i) => CreateTradeUseCase(i())),
    Bind.lazySingleton((i) => TradeRepository(i())),
    Bind.lazySingleton((i) => TradeDataSource(client: i())),
    //Http Client
    Bind.lazySingleton((i) => http.Client()),
    //Store
    Bind.factory((i) => HomeStore(i())),
    Bind.factory((i) => TradeStore(i(), i())),
    Bind.factory((i) => ListCoinStore(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const HomePage()),
        ChildRoute("/list-coin", child: (_, __) => const ListCoinPage()),
        ChildRoute('/new-trade', child: (_, __) => const Trade()),
      ];
}

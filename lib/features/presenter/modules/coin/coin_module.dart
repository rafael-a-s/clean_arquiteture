import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/data/datasources/coin/coin_datasource.dart';
import 'package:my_app/features/data/repositories/coin_repository.dart';
import 'package:my_app/features/domain/usecases/coin/coin_usecase.dart';
import 'package:my_app/features/domain/usecases/coin/get_all_coin_usecase.dart';
import 'package:my_app/features/presenter/modules/coin/controller/coin_controller.dart';
import 'package:my_app/features/presenter/modules/coin/pages/list_coin_page.dart';

class CoinModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CoinUseCase(i()), export: true),
    Bind.lazySingleton((i) => CoinRepository(i()), export: true),
    Bind.lazySingleton((i) => CoinDataSource(client: i()), export: true),
    Bind.lazySingleton((i) => GetAllCoinUseCase(i()), export: true),
    Bind.factory((i) => CoinController(i(), i()), export: true),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/list-coin",
          child: (_, __) => const ListCoinPage(),
          transition: TransitionType.downToUp,
        ),
      ];
}

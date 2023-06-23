import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/data/datasources/assets/assets_datasource.dart';
import 'package:my_app/features/data/datasources/portifolio/portifolio_datasource.dart';
import 'package:my_app/features/data/repositories/assets_repository.dart';
import 'package:my_app/features/data/repositories/portifolio_repository.dart';
import 'package:my_app/features/domain/usecases/assets/get_all_recents_usecase.dart';
import 'package:my_app/features/domain/usecases/portifolio/get_all_portifolios.dart';
import 'package:my_app/features/presenter/modules/home/controller/home_controller.dart';
import 'package:my_app/features/presenter/modules/home/page/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AssetsRepository(i())),
    Bind.lazySingleton((i) => GetAllAssetsRecentsUseCase(i())),
    Bind.lazySingleton((i) => AssetsDataSource(client: i())),
    Bind.lazySingleton((i) => PortifolioRepository(i())),
    Bind.lazySingleton((i) => PortifolioDataSource(client: i())),
    Bind.lazySingleton((i) => GetAllPortifolioUseCase(i())),
    Bind.factory((i) => HomeController(i(), i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomePage(),
          transition: TransitionType.downToUp,
        ),
      ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/presenter/modules/coin/coin_module.dart';
import 'package:my_app/features/presenter/modules/home/home_module.dart';
import 'package:my_app/features/presenter/modules/portifolio/portifolio_module.dart';
import 'package:my_app/features/presenter/widgets/base/screens/status-feedback/status_feedback.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Http Client
    Bind.lazySingleton((i) => http.Client()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/status-feedback",
          child: (_, __) => StatusScreen(
            arguments: __.data,
          ),
          transition: TransitionType.scale,
        ),
        ModuleRoute('/portifolio', module: PortifolioModule()),
        ModuleRoute('/coin', module: CoinModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}

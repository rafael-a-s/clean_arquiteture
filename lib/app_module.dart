import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/utils/date_input_converter.dart';
import 'package:my_app/features/data/datasources/example/example_datasource.dart';
import 'package:my_app/features/data/repositories/example_repository.dart';
import 'package:my_app/features/domain/usecases/get_example_from_username_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GetExampleFromUsernameUsecase(i())),
    Bind.lazySingleton((i) => ExampleRepository(i())),
    Bind.lazySingleton((i) => ExampleDataSource(client: i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, __) => HomePage()),
  ];
}
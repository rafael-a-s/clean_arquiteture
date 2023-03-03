import 'package:my_app/features/data/models/example_model.dart';

abstract class IExampleDataSource {
  Future<ExampleModel> getGitUser(String username);
}
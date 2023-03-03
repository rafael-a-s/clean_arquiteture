import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/features/data/datasources/endpoints/example_endpoints.dart';
import 'package:my_app/features/data/datasources/example/i_example_datasource.dart';
import 'package:my_app/features/data/models/example_model.dart';
import '../../../../core/usecase/erros/exceptions.dart';

class ExampleDataSource implements IExampleDataSource{
  final http.Client client;

  ExampleDataSource({
    required this.client,
  });

  @override
  Future<ExampleModel> getGitUser(String username) async {
   final response = await client.get(ExampleEndPoints.getGitHub(username));

   return response.statusCode == 200 ? ExampleModel.fromJson(json.decode(response.body)) : throw ServerException();
  }

}
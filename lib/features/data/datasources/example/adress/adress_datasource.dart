import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/core/usecase/erros/exceptions.dart';
import 'package:my_app/features/data/datasources/endpoints/via_cep.dart';
import 'package:my_app/features/data/datasources/example/adress/i_adress_datasource.dart';
import 'package:my_app/features/data/models/adress_model.dart';

class AdressDataSource implements IAdressDataSoure{
  final http.Client client;

  AdressDataSource({
    required this.client,
  });

  @override
  Future<AdressModel> getAdressFromCep(String cep) async {
   final response = await client.get(ViaCepApi.getAdressFromCep(cep));

   return response.statusCode == 200 ? AdressModel.fromJson(json.decode(response.body)) : throw ServerException();
  }

}
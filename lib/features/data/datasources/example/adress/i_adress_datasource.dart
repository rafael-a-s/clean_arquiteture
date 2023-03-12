import 'package:my_app/features/data/models/adress_model.dart';

abstract class IAdressDataSoure {
  Future<AdressModel> getAdressFromCep(String cep);
}
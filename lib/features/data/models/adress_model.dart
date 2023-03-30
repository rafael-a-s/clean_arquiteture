import 'package:my_app/features/domain/entities/adress.dart';

class AdressModel extends Adress {
   AdressModel({
    required String cep,
    required String logradouro,
    required String bairro,
    required String cidade,
    required String estado
  }): super(
    cep: cep,
    logradouro: logradouro,
    bairro: bairro,
    cidade: cidade,
    estado: estado
  );

  factory AdressModel.fromJson(Map<String, dynamic> json) =>
      AdressModel(
        cep: json['cep'],
        logradouro: json['logradouro'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        estado: json['estado']
      );

  Map<String, dynamic> toJson() => {
    'cep': cep,
    'logradouro': logradouro,
    'bairro': bairro,
    'cidade': cidade,
    'estado': estado
    };
}
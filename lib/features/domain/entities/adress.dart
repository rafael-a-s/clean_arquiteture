import 'package:equatable/equatable.dart';

class Adress extends Equatable {
  String cep;
  String logradouro;
  String bairro;
  String cidade;
  String estado;

  Adress({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.estado
  });

  @override
  List<Object?> get props => [
    cep,
    logradouro,
    bairro,
    cidade,
    estado
  ];
}
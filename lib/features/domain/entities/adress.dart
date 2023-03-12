import 'package:equatable/equatable.dart';

class Adress extends Equatable {
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String estado;

  const Adress({
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
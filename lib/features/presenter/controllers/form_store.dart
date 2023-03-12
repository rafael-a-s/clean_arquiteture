import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_app/core/usecase/erros/failures.dart';
import 'package:my_app/features/domain/entities/adress.dart';
import 'package:my_app/features/domain/usecases/get_adress_from_cep.dart';

class FormStore extends NotifierStore<Failure, Adress> {
  final GetAdressFromCep usecase;

  FormStore(this.usecase)
      : super(const Adress(cep: '', logradouro: '', bairro: '', cidade: '', estado: ''));

  getAdressFromCep(String cep) async {
    executeEither(() => usecase(cep) as Future<EitherAdapter<Failure, Adress>>);
  }



}

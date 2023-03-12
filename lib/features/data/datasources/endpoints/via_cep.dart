class ViaCepApi{
  static Uri getAdressFromCep(String cep) =>
      Uri.https('viacep.com.br/ws/${cep}/json/');
}
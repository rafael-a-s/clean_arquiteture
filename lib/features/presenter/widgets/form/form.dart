import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/features/domain/entities/adress.dart';
import 'package:my_app/features/domain/usecases/get_adress_from_cep.dart';
import 'package:my_app/features/presenter/controllers/form_store.dart';
import 'package:http/http.dart' as http;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _Form();
}

class _Form extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  final String INVALID_LABEL = 'Campo vazio !';
  final String INVALID_FORMAT_CEP = 'Formato do CEP inválido.';
  final String INVALID_CEP = 'CEP incorreto. Por favor, tente novamente.';
  late Adress _adress;

  @override
  void initState() {
    super.initState();
    _adress =
        Adress(cep: '', logradouro: '', bairro: '', cidade: '', estado: '');
  }

  Future<void> _fetchAddress() async {
    final cep = _cepController.text.replaceAll('-', '');
    if(cep.length != 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(INVALID_FORMAT_CEP)),
        );
        return;
    }
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.containsKey('erro')) {
        setState(() {
          _bairroController.text = '';
          _logradouroController.text = '';
          _cidadeController.text = '';
          _estadoController.text = '';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(INVALID_CEP)),
        );
      }

      _logradouroController.text = json['logradouro'];
      _bairroController.text = json['bairro'];
      _cidadeController.text = json['localidade'];
      _estadoController.text = json['uf'];

      setState(() {});
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _cepController,
              decoration: InputDecoration(
                labelText: 'CEP',
                suffixIcon: IconButton(
                  onPressed: _fetchAddress,
                  icon: const Icon(Icons.search),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                print(value);
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              onSaved: (value) => _adress.cep = value.toString(),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Logradouro'),
              controller: _logradouroController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              onSaved: (value) => _adress.logradouro = value.toString(),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Bairro'),
              controller: _bairroController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              onSaved: (value) => _adress.bairro = value.toString(),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Cidade'),
              controller: _cidadeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              onSaved: (value) => _adress.cidade = value.toString(),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Estado'),
              controller: _estadoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              onSaved: (value) => _adress.estado = value.toString(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _cepController.text = '';
                    _bairroController.text = '';
                    _logradouroController.text = '';
                    _cidadeController.text = '';
                    _estadoController.text = '';
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando dados ...')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

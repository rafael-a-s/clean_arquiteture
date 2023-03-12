import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/features/domain/entities/adress.dart';
import 'package:my_app/features/domain/usecases/get_adress_from_cep.dart';
import 'package:my_app/features/presenter/controllers/form_store.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _Form();
}

class _Form extends State<FormLogin> {

  final _formKey = GlobalKey<FormState>();
  final String INVALID_LABEL = 'Campo vazio !';
  Adress _adress = new Adress(cep: '', logradouro: '', bairro: '', cidade: '', estado: '');

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
              decoration: const InputDecoration(labelText: 'CEP'),
              initialValue: _adress.cep,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Logradouro'),
              initialValue: _adress.logradouro,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Bairro'),
              initialValue: _adress.bairro,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Cidade'),
              initialValue: _adress.cidade,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Estado'),
              initialValue: _adress.estado,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enviando dados ...')));
                }
              },
            ),
            const SizedBox(height: 16.0),
             ElevatedButton(
              child: const Text('Buscar Via Cep'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                if (_adress.cep.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preecha o Cep...')));
                }
                _adress = FormStore(_adress.cep) as Adress;
              },
            ),
          ],
        ),
      ),
    );
  }
}

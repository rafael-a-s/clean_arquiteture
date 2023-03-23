import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/formImc/tela_resultado.dart';

class FormImc extends StatefulWidget {

  const FormImc({super.key});

  @override
  State<FormImc> createState() => _FormImc();

}

class _FormImc extends State<FormImc> {

  final _formKey = GlobalKey<FormState>();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  late double _resultado;

  final String INVALID_LABEL = 'Campo vazio !';

  void _calculateIm(){
    //_pesoController.text/(altura x altura)
    double? peso = double.tryParse(_pesoController.text);
    double? altura = double.tryParse(_alturaController.text);

    
    setState(() {
      _resultado = peso! / (altura! * altura);
    });

    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => TelaResultado(result: _resultado.toStringAsFixed(2)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _alturaController,
              decoration: const  InputDecoration(
                labelText: 'Altura'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                print(value);
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _pesoController,
              decoration: const  InputDecoration(
                labelText: 'Peso'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                print(value);
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                 if (_formKey.currentState!.validate()) {
                  String result;
                  String? condition;
                  _calculateIm();
                  result = _resultado.toStringAsFixed(2);
                  if (_resultado > 25) condition = 'Acima do peso';
                  if(_resultado <= 25) condition = 'Peso ideal';
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('IMC'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('IMC: $result você está $condition'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                }
              }, 
              child: const Icon(Icons.calculate),
            ),
          ],
        ),
      ),
    );
  }

}
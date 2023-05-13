import 'package:flutter/material.dart';

class CreatePortifolio extends StatefulWidget {
  const CreatePortifolio({super.key});

  @override
  State<CreatePortifolio> createState() => _CreatePortifolioState();
}

class _CreatePortifolioState extends State<CreatePortifolio> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();

  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _name,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return INVALID_LABEL;
            }
            return null;
          },
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: const Text('Pesquise aqui'),
            hintText: 'USDT',
            suffix: const Text('\$'),
          ),
        ),
        Text('Procure pela moeda desejada para adicionar ao seu portfólio'),
      ],
    );
  }
}

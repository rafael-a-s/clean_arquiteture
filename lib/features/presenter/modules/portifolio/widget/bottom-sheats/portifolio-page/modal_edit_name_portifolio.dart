import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/widgets/form/form_base.dart';
import 'package:my_app/features/presenter/widgets/text_buttom_base/text_buttom_base.dart';

class ModalEditNamePortifolio extends StatefulWidget {
  const ModalEditNamePortifolio({super.key, required this.portifolio});

  final Portifolio portifolio;

  @override
  State<ModalEditNamePortifolio> createState() =>
      _ModalEditNamePortifolioState();
}

class _ModalEditNamePortifolioState extends State<ModalEditNamePortifolio> {
  final _name = TextEditingController();
  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.text = widget.portifolio.name;
  }

  @override
  Widget build(BuildContext context) {
    return FormBase(
      title: 'Altere o nome do Portifolio',
      buttom: TextButtomBase(
        label: 'Alterar Portifolio',
        onPressed: () {},
      ),
      child: Column(
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
              label: const Text('Nome'),
              suffix: const Text('abc'),
            ),
          ),
        ],
      ),
    );
  }
}

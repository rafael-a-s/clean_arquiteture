import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/presenter/widgets/form/form_base.dart';
import 'package:my_app/features/presenter/widgets/text_buttom_base/text_buttom_base.dart';

class ModalTradeInAssetPortifolio extends StatefulWidget {
  const ModalTradeInAssetPortifolio(
      {super.key, required this.id, required this.asset});
  final dynamic id;
  final Assets asset;
  @override
  State<ModalTradeInAssetPortifolio> createState() =>
      _ModalTradeInAssetPortifolioState();
}

class _ModalTradeInAssetPortifolioState
    extends State<ModalTradeInAssetPortifolio> {
  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';
  final _price = TextEditingController();
  final _quanty = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quanty.text = widget.asset.quanty.toString();
    _price.text = widget.asset.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return FormBase(
      title: 'Retirada de lucro',
      buttom: TextButtomBase(
        label: 'Confirmar venda',
        onPressed: () {},
      ),
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            controller: _quanty,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return INVALID_LABEL;
              }
              return null;
            },
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: Text(
                widget.asset.symbol,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            onChanged: (value) => {
              setState(() {}),
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _price,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autovalidateMode: AutovalidateMode.always,
            onChanged: (value) => {
              setState(() {}),
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return INVALID_LABEL;
              }
              return null;
            },
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: const Text('Preço por moeda'),
              hintText: 'Preço',
              suffix: const Text('\$'),
            ),
          ),
        ],
      ),
    );
  }
}

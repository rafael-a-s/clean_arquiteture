import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/text_buttom_base/text_buttom_base.dart';

class ModalDetailsTransaction extends StatefulWidget {
  const ModalDetailsTransaction({super.key, required this.asset});

  final Assets asset;

  @override
  State<ModalDetailsTransaction> createState() =>
      _ModalDetailsTransactionState();
}

class _ModalDetailsTransactionState extends State<ModalDetailsTransaction> {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: "en_US",
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      decoration: const BoxDecoration(
        color: Color(RootStyle.secondColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Detalhes da transação',
            style: RootStyle.title2Style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                direction: Axis.vertical,
                children: [
                  SvgPicture.asset(
                    'assets/svg/check-circle.svg',
                    width: 120,
                    height: 120,
                  ),
                  const Text(
                    'Confirmada',
                    style: RootStyle.title2Style,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quantidade',
                style: RootStyle.title3Style,
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text('${widget.asset.quanty}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(formatCurrency.format(widget.asset.price)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cod:'),
              Text('${widget.asset.id}'),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Data:'),
              Text('14/12/2023'),
            ],
          ),
          TextButtomBase(label: 'Ver portifolio', onPressed: () {}),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/form/form_base.dart';
import 'package:my_app/features/presenter/widgets/text_buttom_base/text_buttom_base.dart';

class ModalDeletePortifolio extends StatefulWidget {
  const ModalDeletePortifolio({Key? key, required this.portifolio})
      : super(key: key);

  final Portifolio portifolio;

  @override
  State<StatefulWidget> createState() => _ModalDeletePortifolioState();
}

class _ModalDeletePortifolioState extends State<ModalDeletePortifolio> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color(RootStyle.primaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return FormBase(
      title: 'Excluir',
      buttom: TextButtomBase(
        label: 'Excluir meu portifolio',
        onPressed: () {
          if (isChecked) {
            print('Checkbox marcado pode executar a função');
            return;
          }
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(RootStyle.secondColor),
                content: Text(
                  'Marque a caixinha antes de excluir.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
        },
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
              'Esteja ciente que ao deletar um portifolio, não terá mas volta.'),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                checkColor: const Color(RootStyle.bgColor),
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Expanded(
                child: Text(
                  'Ao marcar a caixinha, concordo em excluir ${widget.portifolio.name} da minha lista de portifolios.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

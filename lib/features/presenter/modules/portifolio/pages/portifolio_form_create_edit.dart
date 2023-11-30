import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/core/utils/status-screen-arguments/StatusScreenArgument.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/coin.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/controller/portifolio_controller.dart';
import 'package:my_app/features/presenter/modules/portifolio/controller/portifolio_form_controller.dart';
import 'package:my_app/features/presenter/root.dart';

class PortifolioForm extends StatefulHookConsumerWidget {
  const PortifolioForm({super.key});

  @override
  PortifolioFormState createState() => PortifolioFormState();
}

class PortifolioFormState extends ConsumerState<PortifolioForm> {
  final controller = Modular.get<PortifolioController>();
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _asset = TextEditingController();
  final _quanty = TextEditingController();
  final _price = TextEditingController();
  bool _isFieldEnabled = false;
  late final dynamic id;

  final String INVALID_LABEL = 'Campos obrigatórios não podem ser vazios!';

  _createPortifolio() async {
    ref
        .read(portifolioFormControllerProvider.notifier)
        .createTrade(pathValue());
  }

  resultAndRedirectFeedback(Portifolio result) {
    return result.id == null
        ? Modular.to.navigate(
            '/status-feedback',
            arguments: StatusScreenArguments(
              isError: true,
              message:
                  'Infelizmente ocorreu um erro ao criar seu portifolio. Por favor tente novamente.',
              onPressed: () {
                Modular.to.navigate('/new-portifolio');
              },
            ),
          )
        : Modular.to.navigate(
            '/status-feedback',
            arguments: StatusScreenArguments(
              isError: false,
              message:
                  'Seu portifolio foi criado. Você poderá verificá lo, na página inicial. Fique a vontade para criar novos portifolios e adicionar novas compras.',
              onPressed: () {
                Modular.to.navigate('/home');
              },
            ),
          );
  }

  pathValue() => Portifolio(
        name: _name.text,
        coin: _asset.text,
        subTotal: 0,
        totalPriceActual: 0,
        percent: 0,
        assets: [
          Assets(
            symbol: _asset.text,
            quanty: double.parse(_quanty.text),
            price: double.parse(_price.text),
          ),
        ],
      );

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((__) {
      ref.read(portifolioFormControllerProvider.notifier).fetch();
    });

    _quanty.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(
        portifolioFormControllerProvider.select((value) => value.isLoading));
    final coins = ref
        .watch(portifolioFormControllerProvider.select((value) => value.coins));
    final result = ref.watch(
        portifolioFormControllerProvider.select((value) => value.portifolio));

    if (result != null) resultAndRedirectFeedback(result);

    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      height: double.maxFinite,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color(RootStyle.bgColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Crie seu portifolio',
              style: RootStyle.title1Style,
            ),
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
                label: const Text('Nome *'),
                suffix: const Text('abc'),
              ),
            ),
            const Text(
              'Selecione uma moeda, e crie seu portifolio',
              style: RootStyle.title3Style,
            ),
            Row(
              children: [
                Expanded(
                  child: Autocomplete<Coin>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Coin>.empty();
                      }
                      return coins
                          .where((Coin coin) => coin.symbol
                              .toLowerCase()
                              .startsWith(textEditingValue.text.toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (Coin coin) => coin.symbol,
                    onSelected: (coin) {
                      _price.text = coin.price.toStringAsFixed(9);
                      _asset.text = coin.symbol;
                      setState(() {
                        _isFieldEnabled = true;
                      });
                    },
                  ),
                ),
                const Icon(Icons.search)
              ],
            ),
            TextFormField(
              controller: _quanty,
              keyboardType: TextInputType.number,
              enabled: _isFieldEnabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                label: const Text('Quantidade'),
                suffix: const Text('123'),
                suffixIcon: SizedBox(
                  height: 56, // Altura do TextFormField padrão
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_upward),
                          iconSize: 15, // Tamanho do ícone
                          onPressed: () {
                            setState(() {
                              var value = double.parse(_quanty.text);
                              _quanty.text = (value + 1).toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 15, // Tamanho do ícone
                          onPressed: () {
                            setState(() {
                              var value = double.parse(_quanty.text);
                              value > 0
                                  ? _quanty.text = (value - 1).toString()
                                  : '0';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: _price,
              keyboardType: TextInputType.number,
              enabled: _isFieldEnabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return INVALID_LABEL;
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                label: const Text('Preço'),
                suffix: const Text('\$'),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll<Size?>(
                  Size(double.infinity, 50),
                ),
                backgroundColor: MaterialStatePropertyAll<Color?>(
                  Color(RootStyle.primaryColor),
                ),
              ),
              onPressed: () async => {
                if (_formKey.currentState!.validate())
                  {
                    _createPortifolio(),
                  }
              },
              child: const Text(
                'Criar Portifolio',
                style: TextStyle(
                  color: Color(RootStyle.ptColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

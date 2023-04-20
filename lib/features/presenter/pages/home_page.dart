import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/home/botton-navigation/bottom_navigation.dart';
import 'package:my_app/features/presenter/widgets/home/box-decoration/box_decoration_home.dart';
import 'package:my_app/features/presenter/widgets/home/container-card/container_card.dart';
import 'package:my_app/features/presenter/widgets/home/mini-cards/mini_card.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  var coin = Coin(symbol: '', price: 0.0);

  Future<void> _loadData() async {
    final result = await store.getCoinSymbol("BTCUSDT");
    setState(() {
      coin = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
            const SizedBox(
              height: 30,
            ),
            const ContainerCard(),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const <Widget>[
                MiniCard(
                  label:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                  navigation: 'null',
                  title: 'Cryptos',
                  icon: Icons.card_giftcard,
                ),
                MiniCard(
                  label:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                  navigation: 'null',
                  title: 'Cryptos',
                  icon: Icons.card_giftcard,
                ),
                MiniCard(
                  label:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                  navigation: 'null',
                  title: 'Cryptos',
                  icon: Icons.card_giftcard,
                ),
                MiniCard(
                  label:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                  navigation: 'null',
                  title: 'Cryptos',
                  icon: Icons.card_giftcard,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

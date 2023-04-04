import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/home/botton-navigation/bottom_navigation.dart';
import 'package:my_app/features/presenter/widgets/home/box-decoration/box_decoration_home.dart';
import 'package:my_app/features/presenter/widgets/home/container-card/container_card.dart';
import 'package:my_app/features/presenter/widgets/home/mini-cards/mini_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      height: double.maxFinite,
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
          Wrap(
            children: const <Widget>[
              MiniCard(
                label: 'Entre e veja meus repositorios',
                navigation: 'null',
                title: 'Repositorios',
                icon: Icons.card_giftcard,
              ),
              MiniCard(
                label: 'Entre e veja meus repositorios',
                navigation: 'null',
                title: 'Repositorios',
                icon: Icons.card_giftcard,
              ),
              MiniCard(
                label: 'Entre e veja meus repositorios',
                navigation: 'null',
                title: 'Repositorios',
                icon: Icons.card_giftcard,
              ),
              MiniCard(
                label: 'Entre e veja meus repositorios',
                navigation: 'null',
                title: 'Repositorios',
                icon: Icons.card_giftcard,
              )
            ],
          ),
        ],
      ),
    );
  }
}

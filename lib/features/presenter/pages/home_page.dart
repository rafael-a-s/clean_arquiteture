import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/widgets/home/botton-navigation/bottom_navigation.dart';
import 'package:my_app/features/presenter/widgets/home/box-decoration/box_decoration_home.dart';
import 'package:my_app/features/presenter/widgets/home/mini-cards/mini_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191d24),
      bottomNavigationBar: const BottomNavigation(),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              const BoxDecorationHome(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Portifolio.io',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Olá, me chamo Rafael! \n Bem vindo a meu portifolio.',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding:const EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              MiniCard(
                                color: 0xFF47B4FF,
                                label: ('Projetos'),
                                image: ('assets/images/projects.png'),
                                navigation: ('/projetos'),
                              ),
                              MiniCard(
                                color: 0xFF47B4FF,
                                label: ('Experiências'),
                                image: ('assets/images/experiencia.png'),
                                navigation: ('/experience'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              MiniCard(
                                color: 0xFF47B4FF,
                                label: ('About'),
                                image: ('assets/images/about56.png'),
                                navigation: ('/about'),
                              ),
                              MiniCard(
                                color: 0xFF47B4FF,
                                label: ('About'),
                                image: ('assets/images/about56.png'),
                                navigation: ('/about'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

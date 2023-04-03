import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/presenter/widgets/about/image_circular.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191d24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191d24),
        title: const Text('Sobre mim'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.navigate("/"),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF481fe6),
                  Color(0xFF7f3be6),
                ],
              )),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  SizedBox(height: 20),
                  Row(
                    children: const <Widget>[
                      Expanded(
                          child: Text(
                        "Rafael \n Aguiar.dev",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      Expanded(child: ImageCircle())
                    ],
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'A diferença entre EdgeInsets.all e EdgeInsets.only é que o EdgeInsets.all define a mesma distância em todos os lados de um determinado widget, enquanto o ',
                          style: TextStyle(
                            height: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              color: const Color(0xFF191d24),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF272e38),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    ImageCircle(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rafael Aguiar.dev",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'A diferença entre EdgeInsets.all e EdgeInsets.only é que o EdgeInsets.all define a mesma distância em todos os lados de um determinado widget, enquanto o ',
                        style: TextStyle(
                          height: 1.8,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

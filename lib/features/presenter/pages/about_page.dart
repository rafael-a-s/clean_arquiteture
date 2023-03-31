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
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 71, 47, 254),
                      Color(0xFF7e30ff),
                    ],
                  )),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Text("Rafael \n Aguiar.dev",
                               style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                              )
                            ),
                            Expanded(
                                child: ImageCircle()
                            )
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  color: const Color(0xFF191d24),
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

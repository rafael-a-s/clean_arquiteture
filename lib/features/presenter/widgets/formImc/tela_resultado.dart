import 'package:flutter/material.dart';

class TelaResultado extends StatefulWidget {

  late String result;

  TelaResultado({super.key, required this.result});

  @override
  State<TelaResultado> createState() => _TelaResultado();
}

class _TelaResultado extends State<TelaResultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.result),
            ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text('Voltar'))
          ],
        ),
        ),
      );
  }
}

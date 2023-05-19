import 'package:flutter/material.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/root.dart';

class ContainerCard extends StatefulWidget {
  Portifolio portifolio;

  ContainerCard({super.key, required this.portifolio});

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Color(RootStyle.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.portifolio.name,
                style: const TextStyle(
                    color: Color(RootStyle.ptColor),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            '\$${widget.portifolio.subTotal.toString()}',
            style: const TextStyle(
              color: Color(RootStyle.ptColor),
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '% ${widget.portifolio.percent.toStringAsFixed(2)}',
                style: TextStyle(
                  color:
                      widget.portifolio.percent < 0 ? Colors.red : Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.trending_up,
                size: 40,
                color:
                    widget.portifolio.percent < 0 ? Colors.red : Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}

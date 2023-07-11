import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/text_buttom_base/text_buttom_base.dart';

class FormBase extends StatefulWidget {
  const FormBase({
    super.key,
    required this.child,
    required this.title,
    required this.buttom,
  });

  final Widget child;
  final String title;
  final TextButtomBase buttom;

  @override
  State<FormBase> createState() => _FormBaseState();
}

class _FormBaseState extends State<FormBase> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(RootStyle.secondColor),
        padding:
            const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: RootStyle.title1Style,
            ),
            SizedBox(
              child: widget.child,
            ),
            widget.buttom,
          ],
        ),
      ),
    );
  }
}

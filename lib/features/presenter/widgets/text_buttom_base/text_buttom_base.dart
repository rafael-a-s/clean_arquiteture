import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';

class TextButtomBase extends StatefulWidget {
  const TextButtomBase({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;

  final Function onPressed;

  @override
  State<TextButtomBase> createState() => _TextButtomBaseState();
}

class _TextButtomBaseState extends State<TextButtomBase> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide.none,
        )),
        minimumSize: const MaterialStatePropertyAll<Size?>(
          Size(double.infinity, 50),
        ),
        backgroundColor: const MaterialStatePropertyAll<Color?>(
          Color(RootStyle.primaryColor),
        ),
      ),
      child: Text(
        widget.label,
        style: const TextStyle(
          color: Color(RootStyle.ptColor),
        ),
      ),
    );
  }
}

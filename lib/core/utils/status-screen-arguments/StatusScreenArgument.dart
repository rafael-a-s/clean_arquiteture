import 'package:flutter/material.dart';

class StatusScreenArguments {
  final bool isError;
  final String message;
  final VoidCallback onPressed;

  StatusScreenArguments(
      {required this.isError, required this.message, required this.onPressed});
}

import 'package:flutter/material.dart';

class AppBarSliver extends StatefulWidget implements PreferredSizeWidget{
  
  const AppBarSliver({super.key});

  @override
  State<AppBarSliver> createState() => _AppBarSliver();

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

}

class _AppBarSliver extends State<AppBarSliver> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Ô Plano'),
      );
  }
}
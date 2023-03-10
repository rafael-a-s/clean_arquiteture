import 'package:flutter/material.dart';

class AppBarSliver extends StatefulWidget implements PreferredSizeWidget{
  const AppBarSliver({super.key});

  @override
  State<AppBarSliver> createState() => _AppBarSliver();

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}

class _AppBarSliver extends State<AppBarSliver> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text('Aqui vai o title'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.add),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      );
  }
}
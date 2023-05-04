import 'package:flutter/material.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:my_app/features/presenter/widgets/appbar/app_bar.dart';
import 'package:my_app/features/presenter/widgets/home/botton-navigation/bottom_navigation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;

  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(RootStyle.bgColor),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

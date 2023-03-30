import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: Color(0xFF373856),
      child: Padding(
        padding: const EdgeInsets.only(bottom:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.wallet
            ),
            Icon(
              Icons.person_2_rounded
            ),
            Icon(
              Icons.phone
            ),
          ],
        ),
      ),
    );
  }
}
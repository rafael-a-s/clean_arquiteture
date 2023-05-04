import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 125.0,
        height: 125.0,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://instagram.fpmw5-1.fna.fbcdn.net/v/t51.2885-19/344436751_160569753638121_5777555642109628412_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpmw5-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=CNBuFlBFX6QAX9x_uCw&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDrshhsmyptqmeYfcLLlVvgahSohiPSlw8NGt-dILiGbQ&oe=64578484&_nc_sid=8fd12b"))),
      ),
    );
  }
}

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
                    "https://instagram.fpmw5-1.fna.fbcdn.net/v/t51.2885-19/345768258_187277430887582_5573235443427663009_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpmw5-1.fna.fbcdn.net&_nc_cat=102&_nc_ohc=C8L_z0-4e6MAX_kV4L3&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfA4m0yQcXIZVE3MWsO3uy7ufGX_R-H7ASavv5YJc3q8Yw&oe=6465AB31&_nc_sid=8fd12b"))),
      ),
    );
  }
}

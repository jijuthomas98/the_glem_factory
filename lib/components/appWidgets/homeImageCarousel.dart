import 'package:flutter/material.dart';

class HomeImageCarousel extends StatelessWidget {
  final String img;

  HomeImageCarousel({this.img});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/slider/$img.jpg'),
          ),
        ),
      ),
    );
  }
}

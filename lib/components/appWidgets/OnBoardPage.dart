import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  final String img;
  final String title;
  final String txt;
  OnBoardPage({this.title, this.img, this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/icons/OpeningSlides/$img.png'),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

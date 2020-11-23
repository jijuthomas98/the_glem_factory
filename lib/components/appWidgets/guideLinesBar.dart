import 'package:flutter/material.dart';

class GuidelinesBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height / 9,
      color: Color(0xffF3D8E5),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GuidelinesCard(
            img: 'asset/images/icons/LowerGuideline/GenuineProducts.png',
            title: 'Genuine Products',
          ),
          GuidelinesCard(
            img: 'asset/images/icons/LowerGuideline/BestHomeSalon.png',
            title: 'Best Home Salon',
          ),
          GuidelinesCard(
            img: 'asset/images/icons/LowerGuideline/SecurePayments.png',
            title: 'Secure Payments',
          ),
          GuidelinesCard(
            img: 'asset/images/icons/LowerGuideline/Professionals.png',
            title: 'Professionals',
          ),
          GuidelinesCard(
            img: 'asset/images/icons/LowerGuideline/EasyToUse.png',
            title: 'Easy to Use',
          ),
        ],
      ),
    );
  }
}

class GuidelinesCard extends StatelessWidget {
  final String img;
  final String title;
  GuidelinesCard({this.img, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              child: Image(
                image: AssetImage(img),
              ),
            ),
            Text(
              '$title',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

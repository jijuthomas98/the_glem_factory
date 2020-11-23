import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Cart.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'ABOUT US',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Image(image: AssetImage('asset/images/Images/AboutUs/o.jpg')),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
              ),
            ),
            Align(
              alignment: Alignment(-1, -0.4),
              child: Image(
                  image: ResizeImage(
                      AssetImage('asset/images/Logo/LogoAndMonolog/SM.png'),
                      height: 150,
                      width: 150)),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: 25,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'About Shikha Makeover',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shikha Makeovers, we want to make Beauty and Grooming experience as convient as possible at your own comfort where we connect you with our Best Beauty Professional to have great salon experience at home. We are currently serving in Jabalpur, connect with us for Hair, Beauty, Waxing, Facial, Manicure, Spa and many more services',
                      style: TextStyle(fontSize: 16, fontFamily: 'inter'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Contact Details',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Street Number 6, Sadar Bazaar, Seth Mohalla, Sadar , Jabalpur, Madhya Pradesh 482001',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

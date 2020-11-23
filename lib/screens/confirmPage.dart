import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_glem_factory/screens/HomePage.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'ORDER PLACED ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Image.asset(
                    'asset/images/icons/OpeningSlides/ChooseYourService.png'),
              ),
              Text('Thank You for choosing our service',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'The order has been placed, Bringing home the Glem Factory',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text('PROCEED TO HOME'),
          icon: Icon(FontAwesomeIcons.arrowCircleRight),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

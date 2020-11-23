import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Cart.dart';
import 'LandingPage.dart';
import 'PreviousAppointment.dart';
import 'UpcomingAppointment.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFFFAFA),
        scaffoldBackgroundColor: Color(0xffFFFAFA),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: TabBar(
              tabs: [Tab(text: 'UPCOMING'), Tab(text: 'PREVIOUS')],
            ),
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LandingPage())),
            ),
            title: Text(
              'APPOINTMENTS',
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
          body: TabBarView(
            children: [
              UpcomingAppointment(),
              PreviousAppointment(),
            ],
          ),
        ),
      ),
    );
  }
}

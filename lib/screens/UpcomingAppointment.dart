import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/DateTimeQueryPage.dart';
import 'package:the_glem_factory/components/auth.dart';

class UpcomingAppointment extends StatefulWidget {
  @override
  _UpcomingAppointmentState createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  QueryFirebaseMethod upcoming;

  @override
  Widget build(BuildContext context) {
    upcoming = Provider.of<QueryFirebaseMethod>(context);
    return FutureBuilder(
      future: upcoming.upcomingEvents(Provider.of<Auth>(context).currentUser()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot order = snapshot.data.docs[index];
            return AppointmentCard(
              title: order['title'],
              date: order['event_date'],
              time: order['selected_time'],
              price: order['totalAmount'].toString(),
              paymentStatus: order['PaymentStatus'],
            );
          },
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final String paymentStatus;
  final String date;
  final String time;
  final String price;
  AppointmentCard(
      {this.title, this.paymentStatus, this.date, this.time, this.price});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [];
    titles = title.split('/').toList();
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                        //shrinkWrap: true,
                        itemCount: titles.length,
                        itemBuilder: (context, index) {
                          return Text(
                            titles[index],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          );
                        }),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color:
                            paymentStatus == 'PAID' ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      paymentStatus,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(date),
                  Text('$time:00'),
                  Text('₹ $price'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

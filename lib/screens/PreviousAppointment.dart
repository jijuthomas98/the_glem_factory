import 'package:flutter/material.dart';

class PreviousAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Appointment No: 007',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 20, left: 20),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('Paid'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('19/10/2020'),
                      Text('11 AM'),
                      Text('₹ 998'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

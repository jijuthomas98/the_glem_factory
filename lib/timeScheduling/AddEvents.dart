import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/auth.dart';

import 'DatePage.dart';
import 'DateTimeQueryPage.dart';
import 'EventsOnOrder.dart';
import 'calendarHelper.dart';

class AddEventPage extends StatefulWidget {
  final EventModel note;

  const AddEventPage({Key key, this.note}) : super(key: key);
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String _eventDate;
  bool processing;
  String _time;
  bool conditionsStatisfied;
  // String selectedTime;

  @override
  void initState() {
    super.initState();
    // _eventDate = DateTime.now();
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'DATE & TIME',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          hourMinute30Interval(),
          Text('$_time : 00'),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: Text('$_eventDate'),
                onTap: () async {
                  DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 10),
                  );
                  if (picked != null) {
                    setState(() {
                      print('inside the setState of listTile');
                      _eventDate = DateFormat('dd/MM/yyyy').format(picked);
                    });
                  }
                },
              ),
              SizedBox(height: 10.0),
              ListTile(
                title: Center(
                  child: Text(
                    'Select time for appointment!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              processing
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Theme.of(context).primaryColor,
                        child: MaterialButton(
                            child: Text('SAVE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            onPressed: () async {
                              if (_eventDate != null) {
                                QueryFirebaseMethod()
                                    .getAvailableSlots(_eventDate, _time)
                                    .then((QuerySnapshot docs) async {
                                  if (docs.docs.length == 1) {
                                    showAlertDialogue(context);
                                  } else {
                                    final data = {
                                      'current_userID': auth.currentUser(),
                                      'selected_time': this._time,
                                      "event_date": _eventDate,
                                    };
                                    if (widget.note != null) {
                                      await eventDBS.updateData(
                                          widget.note.id, data);
                                    } else {
                                      await eventDBS.create(data);
                                    }
                                    Navigator.pop(context);
                                    setState(() {
                                      processing = false;
                                    });
                                  }
                                });
                              }
                            }),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget hourMinute30Interval() {
    return TimePickerSpinner(
      spacing: 30,
      minutesInterval: 60,
      onTimeChange: (time) {
        setState(() {
          _time = '${time.hour}';
        });
      },
    );
  }

  showAlertDialogue(BuildContext context) {
    Widget okButton = FlatButton(
        onPressed: () {
          Timer(Duration(milliseconds: 500), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DateSelector()),
            );
          });
        },
        child: Text(' OK! '));

    AlertDialog alert = AlertDialog(
      title: Text('Slot unavailable'),
      content: Text('This slot is already booked please select another slot'),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

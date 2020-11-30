import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:the_glem_factory/screens/Payment.dart';

import '../components/DateTimeQueryPage.dart';
import '../components/EventsOnOrder.dart';
import '../constant.dart';

class DateAndTime extends StatefulWidget {
  final EventModel note;
  const DateAndTime({Key key, this.note}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  DatePickerController _controller = DatePickerController();
  String _eventDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  DateTime _eventDateUnformatted;
  String _time;
  String selectedTimeButton = '';
  // DateTime _selectedValue = DateTime.now();
  String selectedTime;

  @override
  void initState() {
    super.initState();
  }

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
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child: DatePicker(
                DateTime.now(),
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    // _selectedValue = date;
                    _eventDate = DateFormat('dd/MM/yyyy').format(date);
                    _eventDateUnformatted = date;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, top: 35),
              child: Text(
                'AVAILABLE TIME SLOTS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Morning',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '10');
                          setState(() {
                            selectedTimeButton = '10 - 11 AM';
                          });
                        },
                        child: timeWidget(time: '10 - 11 AM'),
                      ),
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '11');
                          setState(() {
                            selectedTimeButton = '11 - 12 PM';
                          });
                        },
                        child: timeWidget(time: '11 - 12 PM'),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Afternoon',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '12');
                          setState(() {
                            selectedTimeButton = '12 - 1 PM';
                          });
                        },
                        child: timeWidget(time: '12 - 1 PM'),
                      ),
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '13');
                          setState(() {
                            selectedTimeButton = '1 - 2 PM';
                          });
                        },
                        child: timeWidget(time: '1 - 2 PM'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '15');
                          setState(() {
                            selectedTimeButton = '3 - 4 PM';
                          });
                        },
                        child: timeWidget(time: '3 - 4 PM'),
                      ),
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '16');
                          setState(() {
                            selectedTimeButton = '4 - 5 PM';
                          });
                        },
                        child: timeWidget(time: '4 - 5 PM'),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Evening',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '17');
                          setState(() {
                            selectedTimeButton = '5 - 6 PM';
                          });
                        },
                        child: timeWidget(time: '5 - 6 PM'),
                      ),
                      InkWell(
                        onTap: () {
                          validateDateTime(time: '18');
                          setState(() {
                            selectedTimeButton = '6 - 7 PM';
                          });
                        },
                        child: timeWidget(time: '6 - 7 PM'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'SELECTED DATE',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _eventDate,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'SELECTED TIME',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedTimeButton,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text('1. Booking time is from 10 AM to 6 PM',
                      style: kNoticeStyle),
                  Text(
                    '2. Extra waiting charges will be applied for making Beautician wait longer',
                    style: kNoticeStyle,
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // final data = {
            //   'current_userID':
            //       Provider.of<Auth>(context, listen: false).currentUser(),
            //   'selected_time': selectedTime,
            //   "event_date": _eventDate,
            // };
            // if (widget.note != null) {
            //   await eventDBS.updateData(widget.note.id, data);
            // } else {
            //   await eventDBS.create(data);
            // }

            if (_time != null && _eventDate != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Payment(
                            time: selectedTime,
                            date: _eventDate,
                            eventDateUnformatted: _eventDateUnformatted,
                          )));
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Warning'),
                      content: Text('Please Select date and time'),
                      actions: [
                        FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text('OK'))
                      ],
                    );
                  });
            }
          },
          label: Text('PAYMENT'),
          icon: Icon(FontAwesomeIcons.arrowCircleRight),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void validateDateTime({String time}) {
    print(time);
    print(_eventDate);
    _time = time;
    if (_eventDate != null) {
      QueryFirebaseMethod()
          .getAvailableSlots(_eventDate, time)
          .then((QuerySnapshot docs) async {
        if (docs.docs.length == 1) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Warning'),
                  content: Text('Booking already exist'),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('OK'))
                    //TODO make a function that disables the time button
                  ],
                );
              });
        } else {
          selectedTime = time;
        }
      });
    }
  }

  Container timeWidget({String time}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffff7d85),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

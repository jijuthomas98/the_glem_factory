import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'AddEvents.dart';
import 'EventsOnOrder.dart';
import 'calendarHelper.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  CalendarController calendarController;
  Map<DateTime, List<dynamic>> events;
  List<dynamic> _selectedEvents;
  DateTime eventDate;
  Duration duration;

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> allEvents) {
    Map<DateTime, List<dynamic>> data = {};
    allEvents.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'AVAILABLE SLOTS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<List<EventModel>>(
          stream: eventDBS.streamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> allEvents = snapshot.data;
              if (allEvents.isNotEmpty) {
                events = _groupEvents(allEvents);
              } else {
                events = {};
                _selectedEvents = [];
              }
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    events: events,
                    initialCalendarFormat: CalendarFormat.month,
                    calendarController: calendarController,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      todayColor: Colors.blue,
                      selectedColor: Colors.deepOrange,
                      todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onDaySelected: (DateTime date, events, _) {
                      setState(() {
                        print('$date');
                        _selectedEvents = events;
                      });
                    },
                    builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      todayDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  ..._selectedEvents.map((event) => ListTile(
                      title: Text('From ${event.selectedTime} is booked ')))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEventPage()));
        },
        label: Text('SELECT DATE & TIME'),
        icon: Icon(FontAwesomeIcons.arrowCircleRight),
      ),
    );
  }
}

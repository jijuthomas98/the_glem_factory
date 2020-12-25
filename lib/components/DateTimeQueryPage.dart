import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_glem_factory/components/EventsOnOrder.dart';

class QueryFirebaseMethod {
  int datetime = DateTime.now().microsecondsSinceEpoch;
  getAvailableSlots(String _eventDate, String _time) {
    return FirebaseFirestore.instance
        .collection('events')
        .where('event_date', isEqualTo: _eventDate)
        .where('selected_time', isEqualTo: _time)
        .get();
  }

  Stream<List<EventModel>> getUpcomingEvents(String uid) {
    return FirebaseFirestore.instance
        .collection('events')
        .where('current_userID', isEqualTo: uid)
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((snapshots) => EventModel.fromMap(snapshots.data())));
  }

  upcomingEvents(String uid) {
    return FirebaseFirestore.instance
        .collection('events')
        .where('current_userID', isEqualTo: uid)
        .where('event_date_unformatted', isGreaterThanOrEqualTo: DateTime.now())
        .orderBy('event_date_unformatted', descending: false)
        .get();
  }

  getEventsHistory(String uid) {
    return FirebaseFirestore.instance
        .collection('events')
        .where('current_userID', isEqualTo: uid)
        .orderBy('event_date_unformatted', descending: false)
        .get();
  }

  getHolidayDate(String date) {
    return FirebaseFirestore.instance
        .collection('holidays')
        .where('holidayDate', isEqualTo: date)
        .get();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime eventDate;
  final String selectedTime;
  final int totalAmount;
  final Timestamp bundleID;
  final DateTime eventDateUnformatted;
  final String transactionID;
  final String status;

  EventModel(
      {this.id,
      this.eventDateUnformatted,
      this.transactionID,
      this.totalAmount,
      this.bundleID,
      this.status,
      this.title,
      this.description,
      this.eventDate,
      this.selectedTime});

  factory EventModel.fromMap(Map data) {
    return EventModel(
        title: data['title'],
        description: data['description'],
        eventDate: DateFormat('dd/MM/yyyy', 'en_US').parse(data['event_date']),
        eventDateUnformatted: data['eventDateUnformatted'],
        status: data['status'],
        bundleID: data['bundleID'],
        totalAmount: data['totalAmount'],
        transactionID: data['transactionID'],
        selectedTime: data['selected_time']);
  }

  factory EventModel.fromDS(String id, Map<String, dynamic> data) {
    return EventModel(
        id: id,
        title: data['title'],
        description: data['description'],
        eventDate: DateFormat('dd/MM/yyyy', 'en_US').parse(data['event_date']),
        eventDateUnformatted: data['eventDateUnformatted'],
        status: data['status'],
        bundleID: data['bundleID'],
        totalAmount: data['totalAmount'],
        transactionID: data['transactionID'],
        selectedTime: data['selected_time']);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "event_date": DateFormat('dd/MM/yyyy', 'en_US').parse('event_date'),
      "id": id,
      "selected_time": selectedTime,
      "bundleID": bundleID,
      'totalAmount': totalAmount,
      "status": status,
      'TransactionID': transactionID,
      'eventDateUnformatted': eventDateUnformatted,
    };
  }
}

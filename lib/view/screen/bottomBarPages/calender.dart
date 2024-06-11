// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cytc/linkapi.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final response = await http.get(Uri.parse(LinkApi.allevents));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          events = data;
        });
      } else {
        throw Exception('Failed to load events');
      }
    } catch (error) {
      print('Error fetching events: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
          height: MediaQuery.of(context).size.height * 0.8, // 80% of screen height
          child: SfCalendar(
            view: CalendarView.month,
            headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.left,
              // backgroundColor: Color(0xFFf3c344), // Change header background color
              textStyle: TextStyle(color: Color(0xFF071533), fontSize: 20),
            ),
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: TextStyle(color: Color(0xFF071533), fontSize: 16),
              dateTextStyle: TextStyle(color: Color(0xFF071533), fontSize: 16),
            ),
            todayHighlightColor: Color(0xFFf3c344), // Change today's highlight color
            monthViewSettings: MonthViewSettings(
              dayFormat: 'EEE',
              numberOfWeeksInView: 6,
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
              agendaItemHeight: 50,
            ),
            dataSource: EventDataSource(events),
            appointmentTextStyle: TextStyle(color: Color(0xFFf3c344)), // Change appointment text color to yellow
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                final List<Appointment>? appointments = details.appointments?.cast<Appointment>();
                if (appointments != null && appointments.isNotEmpty) {
                  final eventNames = appointments.map((event) => event.subject).toList();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Events on this day'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var eventName in eventNames)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: $eventName'),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showEventDetailsDialog(eventName);
                                  },
                                  child: Text('Show Details'),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  void showEventDetailsDialog(String eventName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Event Details'),
        content: Text('Details about $eventName will be shown here.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<dynamic> source) {
    appointments = source.map((event) {
      return Appointment(
        startTime: DateTime.parse(event['startDate']),
        endTime: DateTime.parse(event['endDate']),
        isAllDay: false,
        subject: event['name'],
      );
    }).toList();
  }
}

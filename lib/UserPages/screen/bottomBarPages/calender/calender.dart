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
  DateTime? selectedDate;

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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'اختر تاريخا لمعرفة التفاصيل',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
              height: MediaQuery.of(context).size.height * 0.75, // 75% of screen height
              child: SfCalendar(
                view: CalendarView.month,
                firstDayOfWeek: 6, // Start the week on Saturday
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.left,
                  textStyle: TextStyle(color: Color(0xFF071533), fontSize: 20, fontFamily: 'Amiri'),
                ),
                viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle: TextStyle(color: Color(0xFF071533), fontSize: 16, fontFamily: 'Amiri'),
                  dateTextStyle: TextStyle(color: Color(0xFF071533), fontSize: 16, fontFamily: 'Amiri'),
                ),
                todayHighlightColor: Color(0xFFffe145), // Change today's highlight color
                monthViewSettings: MonthViewSettings(
                  dayFormat: 'EEE',
                  numberOfWeeksInView: 6,
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  agendaItemHeight: 50,
                ),
                dataSource: EventDataSource(events),
                appointmentTextStyle: TextStyle(color: Color(0xFF071533)), // Change appointment text color to blue
                onTap: (CalendarTapDetails details) {
                  if (details.targetElement == CalendarElement.calendarCell) {
                    setState(() {
                      selectedDate = details.date;
                    });
                    final List<Appointment>? appointments = details.appointments?.cast<Appointment>();
                    if (appointments != null && appointments.isNotEmpty) {
                      final eventNames = appointments.map((event) => event.subject).toList();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          titlePadding: EdgeInsets.only(top: 20.0, right: 20.0, left: 0.0, bottom: 10.0), // Adjust padding to fit the close icon
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          title: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'الانشطة التي توافق هذا اليوم',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF071533),
                                    fontFamily: 'Amiri',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: Icon(Icons.close, color: Colors.grey, size:18,),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.center,
                              child: Image.asset(
                                'assets/gif/calendar.gif', 
                                width: 90, 
                                height: 90,
                                ),
                              ),
                              for (var eventName in eventNames)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$eventName',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF071533),
                                        fontFamily: 'Amiri',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Navigator.of(context).pop();
                                          // showEventDetailsDialog(eventName);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF071533),
                                          side: BorderSide(color: Color(0xFF071533)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                                        ),
                                        child: Text(
                                          'اعرف المزيد',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Amiri',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                },
                cellBorderColor: Color(0xFF071533), // Border color for calendar cells
                selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFFffe145), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                ),
                monthCellBuilder: (BuildContext context, MonthCellDetails details) {
                  bool isEventDay = events.any((event) {
                    final eventDate = DateTime.parse(event['startDate']);
                    return eventDate.year == details.date.year &&
                        eventDate.month == details.date.month &&
                        eventDate.day == details.date.day;
                  });
                  bool isSelected = selectedDate != null &&
                      details.date.year == selectedDate!.year &&
                      details.date.month == selectedDate!.month &&
                      details.date.day == selectedDate!.day;
                  bool isToday = details.date.year == DateTime.now().year &&
                      details.date.month == DateTime.now().month &&
                      details.date.day == DateTime.now().day;
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected
                          ? Color(0xFFffe145).withOpacity(0.3)
                          : isToday
                              ? Color(0xFFffe145).withOpacity(0.6)
                              : Colors.transparent,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            details.date.day.toString(),
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xFF071533)
                                  : isToday
                                      ? Color(0xFF071533).withOpacity(0.7)
                                      : Colors.black,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ),
                        if (isEventDay)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 5,
                              height: 5,
                              margin: EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue, // Color of the event dot
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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

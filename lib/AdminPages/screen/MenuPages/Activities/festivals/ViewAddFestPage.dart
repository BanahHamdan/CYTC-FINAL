// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewAddFestPage extends StatefulWidget {
  final String userId;
  final String userRole;
  const ViewAddFestPage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _ViewAddFestPageState createState() => _ViewAddFestPageState();
}

class _ViewAddFestPageState extends State<ViewAddFestPage> {
  List<Event> events = [];
  bool isEditing = false;
  int? editingIndex;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    List<Event> fetchedEvents = [
      Event(
        date: DateTime.now(),
        time: TimeOfDay.now(),
        name: 'مهرجان فرحة عيد ',
        location: 'منتزه جمال عبدالناصر',
        description: 'على شرف أطفال الشهداء والأسرى وبمشاركة ابنة الأسير البطل وليد دقة ندعوكم للمشاركة بالمهرجان الجماهيري الكبير "فرحة عيد" يوم الجمعة . الفرق المشاركة: فرقة عمو الطبيب, الفرقة القومية, مسرح الأطفال, فرقة الاستقلال للفنون الشعبية, كشافة مركز يافا الثقافي, فرقة الإغاثة الطبية الفلسطينية / مركز الشباب',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 1)),
        shownToUser: false,
        isEditing: false,
      ),
      Event(
        date: DateTime.now(),
        time: TimeOfDay.now(),
        name: 'حفل تخريج افواج الاغاثة الطبية',
        location: 'صالة الماسة',
        description: 'سيتم اقامة الحفل في صالة الماسة في تمام الساعة ال 3 ظهرا وسيستمر لمدة ساعتين',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 1)),
        shownToUser: false,
        isEditing: false,
      ),
    ];

    setState(() {
      events = fetchedEvents;
    });
  }

  void _addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }

  void _editEvent(int index, Event event) {
    setState(() {
      events[index] = event;
    });
  }

  void _deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF071533),
            hintColor: Color(0xFF071533),
            colorScheme: ColorScheme.light(primary: Color(0xFF071533)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xFF071533),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF071533),
            hintColor: Color(0xFF071533),
            colorScheme: ColorScheme.light(primary: Color(0xFF071533)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xFF071533),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(0xFF071533)),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                LineAwesomeIcons.angle_right_solid,
                color: Color(0xFF071533),
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddEventDialog(context),
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Color(0xFFffe145),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'المهرجانات والاحتفالات',
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF071533)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1.5),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1.2),
                              7: FlexColumnWidth(1),
                              8: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xFFe0e0e0),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                children: [
                                  _buildHeaderCell('ظهوره للمستخدم'),
                                  _buildHeaderCell('تعديل'),
                                  _buildHeaderCell('الوقت'),
                                  _buildHeaderCell('تاريخ البداية والنهاية'),
                                  _buildHeaderCell('الموقع'),
                                  _buildHeaderCell('الوصف'),
                                  _buildHeaderCell('اسم النشاط'),
                                  _buildHeaderCell('الوقت'),
                                  _buildHeaderCell('التاريخ'),
                                ],
                              ),
                              ...events.asMap().entries.map((entry) {
                                int index = entry.key;
                                Event event = entry.value;
                                return TableRow(
                                  children: [
                                    _buildTableCell(event.shownToUser ? 'تم إظهاره للمستخدم' : ''),
                                    _buildEditDeleteSaveButtons(index),
                                    _buildTableCell('${event.time.format(context)}'),
                                    _buildTableCell('${event.startDate.toLocal()}'.split(' ')[0] + ' - ' + '${event.endDate.toLocal()}'.split(' ')[0]),
                                    _buildTableCell(event.location),
                                    _buildTableCell(event.description),
                                    _buildTableCell(event.name),
                                    _buildTableCell('${event.time.format(context)}'),
                                    _buildTableCell('${event.date.toLocal()}'.split(' ')[0]),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableCell _buildHeaderCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontWeight: FontWeight.bold,
            color: Color(0xFF071533),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  TableCell _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            color: Color(0xFF071533),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  TableCell _buildEditDeleteSaveButtons(int index) {
    return TableCell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Color(0xFFffe145),
                ),
                onPressed: () {
                  setState(() {
                    events[index].isEditing = true;
                    editingIndex = index;
                  });
                  _showEditEventDialog(index, context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => _deleteEvent(index),
              ),
            ],
          ),
          if (!events[index].shownToUser)
            IconButton(
              icon: Icon(Icons.save, color: Colors.blue),
              onPressed: () {
                setState(() {
                  events[index].shownToUser = true;
                  events[index].isEditing = false;
                  editingIndex = null;
                });
              },
            ),
        ],
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController locationController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();
        TextEditingController startDateController = TextEditingController();
        TextEditingController endDateController = TextEditingController();
        TextEditingController timeController = TextEditingController();
        String errorMessage = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'إضافة نشاط جديد',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    color: Color(0xFF071533)
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'اسم النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: locationController,
                      decoration: InputDecoration(
                        hintText: 'موقع النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'الوصف',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: startDateController,
                      decoration: InputDecoration(
                        hintText: 'تاريخ بداية النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        await _selectDate(context, startDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: endDateController,
                      decoration: InputDecoration(
                        hintText: 'تاريخ نهاية النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        await _selectDate(context, endDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: timeController,
                      decoration: InputDecoration(
                        hintText: 'وقت النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        await _selectTime(context, timeController);
                      },
                      readOnly: true,
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'إلغاء',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Color(0xFF071533)),
                    ),
                  ),
                  child: Text(
                    'إضافة',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      color: Color(0xFF071533),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        timeController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event newEvent = Event(
                        date: DateTime.now(),
                        time: TimeOfDay.now(),
                        name: nameController.text,
                        location: locationController.text,
                        description: descriptionController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        shownToUser: false,
                        isEditing: false,
                      );
                      _addEvent(newEvent);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditEventDialog(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Event event = events[index];
        TextEditingController nameController = TextEditingController(text: event.name);
        TextEditingController locationController = TextEditingController(text: event.location);
        TextEditingController descriptionController = TextEditingController(text: event.description);
        TextEditingController startDateController = TextEditingController(text: event.startDate.toLocal().toString().split(' ')[0]);
        TextEditingController endDateController = TextEditingController(text: event.endDate.toLocal().toString().split(' ')[0]);
        TextEditingController timeController = TextEditingController(text: event.time.format(context));
        String errorMessage = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'تعديل النشاط',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    color: Color(0xFF071533)
                  ),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'اسم النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: locationController,
                      decoration: InputDecoration(
                        hintText: 'موقع النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'الوصف',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: startDateController,
                      decoration: InputDecoration(
                        hintText: 'تاريخ بداية النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        await _selectDate(context, startDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: endDateController,
                      decoration: InputDecoration(
                        hintText: 'تاريخ نهاية النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        await _selectDate(context, endDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: timeController,
                      decoration: InputDecoration(
                        hintText: 'وقت النشاط',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                      onTap: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: event.time,
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: Color(0xFF071533),
                                hintColor: Color(0xFF071533),
                                colorScheme: ColorScheme.light(primary: Color(0xFF071533)),
                                buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                dialogBackgroundColor: Colors.white,
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: Color(0xFF071533),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                dialogTheme: DialogTheme(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setState(() {
                            timeController.text = picked.format(context);
                          });
                        }
                      },
                      readOnly: true,
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'إلغاء',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text(
                    'حفظ',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      color: Color(0xFF071533),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Color(0xFF071533)),
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        locationController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        timeController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event updatedEvent = Event(
                        date: event.date,
                        time: TimeOfDay.now(),
                        name: nameController.text,
                        location: locationController.text,
                        description: descriptionController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        shownToUser: event.shownToUser,
                        isEditing: false,
                      );
                      _editEvent(index, updatedEvent);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class Event {
  DateTime date;
  TimeOfDay time;
  String name;
  String location;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool shownToUser;
  bool isEditing;

  Event({
    required this.date,
    required this.time,
    required this.name,
    required this.location,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.shownToUser,
    required this.isEditing,
  });
}

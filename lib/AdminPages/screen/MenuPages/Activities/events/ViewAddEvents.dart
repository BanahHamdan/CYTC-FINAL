// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cytc/AdminPages/screen/MenuPages/Activities/activities.dart';
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ViewAddEventsPage extends StatefulWidget {
  
  final String userId;
  final String userRole;
  const ViewAddEventsPage({Key? key, required this.userId, required this.userRole}) : super(key: key);

  @override
  _ViewAddEventsPageState createState() => _ViewAddEventsPageState();
}

class _ViewAddEventsPageState extends State<ViewAddEventsPage> {
  List<Event> events = [];
  bool isEditing = false;
  int? editingIndex;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    // Fetch data from the backend
    // This is just a placeholder. Replace it with your actual backend call.
    List<Event> fetchedEvents = [
      Event(
        date: DateTime.now(),
        time: TimeOfDay.now(),
        name: 'ورشة عمل تطوير تطبيقات',
        category: 'ورش عمل ولقاءات توعوية',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 1)),
        participantAges: '18-25',
        numberOfParticipants: 30,
        participantsInfo: 'info.pdf',
        shownToUser: false,
        isEditing: false,
      ),
      // Add more events as needed
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

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0];
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminBar(userId: widget.userId, userRole: widget.userRole), //EventsPage(userId: widget.userId, userRole: widget.userRole),
                  ),
                );
              },
            ),
          ],
          // title: Text(
          //   'النشاطات',
          //   style: TextStyle(
          //     fontFamily: 'Amiri',
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //     fontSize: 18,
          //   ),
          // ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddEventDialog(),
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
                          'انشطة المركز',
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
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                              7: FlexColumnWidth(1),
                              8: FlexColumnWidth(1),
                              9: FlexColumnWidth(1),
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
                                  _buildHeaderCell('معلومات المشاركين'),
                                  _buildHeaderCell('عدد المشاركين'),
                                  _buildHeaderCell('ظهوره للمستخدم'),
                                  _buildHeaderCell('تعديل'),
                                  _buildHeaderCell('أعمار المشاركين'),
                                  _buildHeaderCell(
                                      'تاريخ بداية وانتهاء النشاط'),
                                  _buildHeaderCell('تصنيف النشاط'),
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
                                    _buildTableCellWithButton(
                                        'معلومات',
                                        () => _showParticipantsInfo(
                                            event.participantsInfo)),
                                    _buildTableCell(
                                        event.numberOfParticipants.toString()),
                                    _buildTableCell(event.shownToUser
                                        ? 'تم إظهاره للمستخدم'
                                        : ''),
                                    _buildEditDeleteSaveButtons(index),
                                    _buildTableCell(event.participantAges),
                                    _buildTableCell(
                                        '${event.startDate.toLocal()}'
                                                .split(' ')[0] +
                                            ' - ' +
                                            '${event.endDate.toLocal()}'
                                                .split(' ')[0]),
                                    _buildTableCell(event.category),
                                    _buildTableCell(event.name),
                                    _buildTableCell(
                                        '${event.time.format(context)}'),
                                    _buildTableCell('${event.date.toLocal()}'
                                        .split(' ')[0]),
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

  TableCell _buildTableCellWithButton(String text, VoidCallback onPressed) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Amiri',
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF071533),
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
                  _showEditEventDialog(index);
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

  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController categoryController = TextEditingController();
        TextEditingController startDateController = TextEditingController();
        TextEditingController endDateController = TextEditingController();
        TextEditingController participantAgesController =
            TextEditingController();
        String errorMessage = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('إضافة نشاط جديد'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'اسم النشاط'),
                    ),
                    DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(child: Text('دورات'), value: 'دورات'),
                        DropdownMenuItem(
                            child: Text('ورش عمل ولقاءات توعوية'),
                            value: 'ورش عمل ولقاءات توعوية'),
                        DropdownMenuItem(
                            child: Text('مخيمات صيفية'), value: 'مخيمات صيفية'),
                        DropdownMenuItem(
                            child: Text('مبادرات شبابية'),
                            value: 'مبادرات شبابية'),
                        DropdownMenuItem(
                            child: Text('حملات تطوعية'), value: 'حملات تطوعية'),
                      ],
                      onChanged: (value) {
                        categoryController.text = value.toString();
                      },
                      decoration: InputDecoration(labelText: 'تصنيف النشاط'),
                    ),
                    TextField(
                      controller: startDateController,
                      decoration:
                          InputDecoration(labelText: 'تاريخ بداية النشاط'),
                      onTap: () async {
                        await _selectDate(context, startDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      controller: endDateController,
                      decoration:
                          InputDecoration(labelText: 'تاريخ نهاية النشاط'),
                      onTap: () async {
                        await _selectDate(context, endDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      controller: participantAgesController,
                      decoration: InputDecoration(labelText: 'أعمار المشاركين'),
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('إلغاء'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('إضافة'),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        categoryController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        participantAgesController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event newEvent = Event(
                        date: DateTime.now(),
                        time: TimeOfDay.now(),
                        name: nameController.text,
                        category: categoryController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        participantAges: participantAgesController.text,
                        numberOfParticipants:
                            0, // This should be set based on actual data
                        participantsInfo: 'info.pdf', // Placeholder
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

  void _showEditEventDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        Event event = events[index];
        TextEditingController nameController =
            TextEditingController(text: event.name);
        TextEditingController categoryController =
            TextEditingController(text: event.category);
        TextEditingController startDateController = TextEditingController(
            text: event.startDate.toLocal().toString().split(' ')[0]);
        TextEditingController endDateController = TextEditingController(
            text: event.endDate.toLocal().toString().split(' ')[0]);
        TextEditingController participantAgesController =
            TextEditingController(text: event.participantAges);
        String errorMessage = '';

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('تعديل النشاط'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'اسم النشاط'),
                    ),
                    DropdownButtonFormField(
                      value: event.category,
                      items: [
                        DropdownMenuItem(child: Text('دورات'), value: 'دورات'),
                        DropdownMenuItem(
                            child: Text('ورش عمل ولقاءات توعوية'),
                            value: 'ورش عمل ولقاءات توعوية'),
                        DropdownMenuItem(
                            child: Text('مخيمات صيفية'), value: 'مخيمات صيفية'),
                        DropdownMenuItem(
                            child: Text('مبادرات شبابية'),
                            value: 'مبادرات شبابية'),
                        DropdownMenuItem(
                            child: Text('حملات تطوعية'), value: 'حملات تطوعية'),
                      ],
                      onChanged: (value) {
                        categoryController.text = value.toString();
                      },
                      decoration: InputDecoration(labelText: 'تصنيف النشاط'),
                    ),
                    TextField(
                      controller: startDateController,
                      decoration:
                          InputDecoration(labelText: 'تاريخ بداية النشاط'),
                      onTap: () async {
                        await _selectDate(context, startDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      controller: endDateController,
                      decoration:
                          InputDecoration(labelText: 'تاريخ نهاية النشاط'),
                      onTap: () async {
                        await _selectDate(context, endDateController);
                      },
                      readOnly: true,
                    ),
                    TextField(
                      controller: participantAgesController,
                      decoration: InputDecoration(labelText: 'أعمار المشاركين'),
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('إلغاء'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('حفظ'),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        categoryController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        participantAgesController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event updatedEvent = Event(
                        date: event.date,
                        time: event.time,
                        name: nameController.text,
                        category: categoryController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        participantAges: participantAgesController.text,
                        numberOfParticipants: event.numberOfParticipants,
                        participantsInfo: event.participantsInfo,
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

  void _showParticipantsInfo(String info) {
    // Show participants info in a new page or dialog
  }
}

class Event {
  DateTime date;
  TimeOfDay time;
  String name;
  String category;
  DateTime startDate;
  DateTime endDate;
  String participantAges;
  int numberOfParticipants;
  String participantsInfo;
  bool shownToUser;
  bool isEditing;

  Event({
    required this.date,
    required this.time,
    required this.name,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.participantAges,
    required this.numberOfParticipants,
    required this.participantsInfo,
    required this.shownToUser,
    required this.isEditing,
  });
}

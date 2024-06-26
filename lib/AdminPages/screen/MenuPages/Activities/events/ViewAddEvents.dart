// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:cytc/AdminPages/screen/MenuPages/Activities/events/EventsParticipantsView.dart';
// import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ViewAddEventsPage extends StatefulWidget {
//   final String userId;
//   final String userRole;
//   const ViewAddEventsPage(
//       {Key? key, required this.userId, required this.userRole})
//       : super(key: key);

//   @override
//   _ViewAddEventsPageState createState() => _ViewAddEventsPageState();
// }

// class _ViewAddEventsPageState extends State<ViewAddEventsPage> {
//   List<Event> events = [];
//   bool isEditing = false;
//   int? editingIndex;
//   List<String> categories = [];
//   List<String> notificationOptions = [
//     'لجميع المستخدمين',
//     'للمهتمين بهذا النوع من الانشطة فقط'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     fetchEvents();
//     fetchCategories().then((value) {
//       setState(() {
//         categories = value;
//       });
//     });
//   }

//   Future<void> fetchEvents() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/event/all'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       List<Event> fetchedEvents = data
//           .map((item) {
//             return Event(
//               id: item['_id'],
//               date: DateTime.parse(item['startDate']),
//               time: TimeOfDay.fromDateTime(DateTime.parse(item['startDate'])),
//               name: item['name'],
//               category: item['interests'],
//               description: item['description'],
//               startDate: DateTime.parse(item['startDate']),
//               endDate: DateTime.parse(item['endDate']),
//               maxParticipants: item['maxParticipants'],
//               registeredParticipants: item['registeredParticipants'],
//               numberOfParticipants: item['maxParticipants'],
//               shownToUser: false,
//               isEditing: false,
//               notification: '',
//               participantAgeRange: '',
//             );
//           })
//           .toList()
//           .cast<Event>();

//       setState(() {
//         events = fetchedEvents;
//       });
//     } else {
//       print('Failed to load events');
//     }
//   }

//   Future<List<String>> fetchCategories() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:9999/interest/all'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data
//           .map<String>((item) => item['interestName'].toString())
//           .toList();
//     } else {
//       print('Failed to load categories');
//       return [];
//     }
//   }

//   void _addEvent(Event event) {
//     setState(() {
//       events.add(event);
//     });
//   }

//   void _editEvent(int index, Event event) {
//     setState(() {
//       events[index] = event;
//     });
//   }

//   void _deleteEvent(int index) {
//     setState(() {
//       events.removeAt(index);
//     });
//   }

//   Future<void> _selectDate(
//       BuildContext context, TextEditingController controller) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: Color(0xFF071533),
//             hintColor: Color(0xFF071533),
//             colorScheme: ColorScheme.light(primary: Color(0xFF071533)),
//             buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//             dialogBackgroundColor: Colors.white,
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//               ),
//             ),
//             dialogTheme: DialogTheme(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = picked.toLocal().toString().split(' ')[0];
//       });
//     }
//   }

//   Future<void> _createEvent(String name, String startDate, String endDate,
//       String description, int maxParticipants, String category) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:9999/event/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'name': name,
//         'startDate': startDate,
//         'endDate': endDate,
//         'description': description,
//         'maxParticipants': maxParticipants,
//         'interests': category,
//       }),
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       fetchEvents();
//     } else {
//       throw Exception('Failed to create event');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF071533),
//         fontFamily: 'Amiri',
//         textTheme: TextTheme(
//           bodyText2: TextStyle(color: Color(0xFF071533)),
//         ),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           actions: [
//             IconButton(
//               icon: Icon(
//                 LineAwesomeIcons.angle_right_solid,
//                 color: Color(0xFF071533),
//                 size: 20,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AdminBar(
//                         userId: widget.userId, userRole: widget.userRole),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _showAddEventDialog(context),
//           child: Icon(
//             Icons.add,
//           ),
//           backgroundColor: Color(0xFFffe145),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Center(
//                           child: Text(
//                             'انشطة المركز',
//                             style: TextStyle(
//                               fontFamily: 'Amiri',
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF071533),
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Color(0xFF071533)),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Table(
//                             columnWidths: {
//                               0: FlexColumnWidth(1),
//                               1: FlexColumnWidth(0.8),
//                               2: FlexColumnWidth(1),
//                               3: FlexColumnWidth(1),
//                               4: FlexColumnWidth(1),
//                               5: FlexColumnWidth(1),
//                               6: FlexColumnWidth(1),
//                               7: FlexColumnWidth(1),
//                               8: FlexColumnWidth(2),
//                               9: FlexColumnWidth(1),
//                               10: FlexColumnWidth(0.9),
//                               11: FlexColumnWidth(1),
//                             },
//                             children: [
//                               TableRow(
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFe0e0e0),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(20),
//                                     topRight: Radius.circular(20),
//                                   ),
//                                 ),
//                                 children: [
//                                   _buildHeaderCell('معلومات المشاركين'),
//                                   _buildHeaderCell('المشاركين المسجلين'),
//                                   _buildHeaderCell('العدد الاقصى للمشاركين'),
//                                   _buildHeaderCell('ظهوره للمستخدم'),
//                                   _buildHeaderCell(
//                                       'تاريخ بداية وانتهاء النشاط'),
//                                   _buildHeaderCell('وصول الاشعارات'),
//                                   _buildHeaderCell('اعمار المشاركين'),
//                                   _buildHeaderCell('تعديل'),
//                                   _buildHeaderCell('الوصف'),
//                                   _buildHeaderCell('تصنيف النشاط'),
//                                   _buildHeaderCell('اسم النشاط'),
//                                   _buildHeaderCell('الوقت'),
//                                   _buildHeaderCell('التاريخ'),
//                                 ],
//                               ),
//                               ...events.asMap().entries.map((entry) {
//                                 int index = entry.key;
//                                 Event event = entry.value;
//                                 return TableRow(
//                                   children: [
//                                     _buildTableCellWithButton(
//                                         'معلومات',
//                                         () => _showParticipantsInfo(
//                                             event.id, context)),
//                                     _buildTableCell(event.registeredParticipants
//                                         .toString()),
//                                     _buildTableCell(
//                                         event.maxParticipants.toString()),
//                                     _buildTableCell(event.shownToUser
//                                         ? 'تم إظهاره للمستخدم'
//                                         : ''),
//                                     _buildTableCell(
//                                         '${event.startDate.toLocal()}'
//                                                 .split(' ')[0] +
//                                             ' - ' +
//                                             '${event.endDate.toLocal()}'
//                                                 .split(' ')[0]),
//                                     _buildTableCell(event.notification),
//                                     _buildTableCell(event.participantAgeRange),
//                                     _buildEditDeleteSaveButtons(index),
//                                     _buildTableCell(event.description),
//                                     _buildTableCell(event.category),
//                                     _buildTableCell(event.name),
//                                     _buildTableCell(
//                                         '${event.time.format(context)}'),
//                                     _buildTableCell('${event.date.toLocal()}'
//                                         .split(' ')[0]),
//                                   ],
//                                 );
//                               }).toList(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildHeaderCell(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF071533),
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildTableCell(String text) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Amiri',
//             color: Color(0xFF071533),
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildTableCellWithButton(String text, VoidCallback onPressed) {
//     return TableCell(
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: ElevatedButton(
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(
//               fontFamily: 'Amiri',
//               color: Colors.white,
//               fontSize: 10,
//             ),
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFF071533),
//           ),
//         ),
//       ),
//     );
//   }

//   TableCell _buildEditDeleteSaveButtons(int index) {
//     return TableCell(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.edit,
//               color: Color(0xFFffe145),
//             ),
//             onPressed: () {
//               setState(() {
//                 events[index].isEditing = true;
//                 editingIndex = index;
//               });
//               _showEditEventDialog(index, context);
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.delete,
//               color: Colors.red,
//             ),
//             onPressed: () => _deleteEvent(index),
//           ),
//           if (!events[index].shownToUser)
//             IconButton(
//               icon: Icon(Icons.save, color: Colors.blue),
//               onPressed: () {
//                 setState(() {
//                   events[index].shownToUser = true;
//                   events[index].isEditing = false;
//                   editingIndex = null;
//                 });
//               },
//             ),
//         ],
//       ),
//     );
//   }

//   void _showAddEventDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         TextEditingController nameController = TextEditingController();
//         TextEditingController categoryController = TextEditingController();
//         TextEditingController descriptionController = TextEditingController();
//         TextEditingController startDateController = TextEditingController();
//         TextEditingController endDateController = TextEditingController();
//         TextEditingController maxParticipantsController =
//             TextEditingController();
//         TextEditingController ageRangeController = TextEditingController();
//         String notification = '';
//         String errorMessage = '';

//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Center(
//                 child: Text(
//                   'إضافة نشاط جديد',
//                   style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 18,
//                     color: Color(0xFF071533),
//                   ),
//                 ),
//               ),
//               content: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         hintText: 'اسم النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     FutureBuilder<List<String>>(
//                       future: fetchCategories(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CircularProgressIndicator();
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return DropdownButtonFormField(
//                             items: snapshot.data!.map((String category) {
//                               return DropdownMenuItem(
//                                 value: category,
//                                 child: Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     category,
//                                     style: TextStyle(
//                                       fontFamily: 'Amiri',
//                                       fontSize: 12,
//                                       color: Color(0xFF071533),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               categoryController.text = value.toString();
//                             },
//                             decoration: InputDecoration(
//                               hintText: 'تصنيف النشاط',
//                               hintStyle: TextStyle(
//                                 fontFamily: 'Amiri',
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xFFffe145)),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: descriptionController,
//                       maxLines: 3,
//                       decoration: InputDecoration(
//                         hintText: 'الوصف',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: startDateController,
//                       decoration: InputDecoration(
//                         hintText: 'تاريخ بداية النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                       onTap: () async {
//                         await _selectDate(context, startDateController);
//                       },
//                       readOnly: true,
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: endDateController,
//                       decoration: InputDecoration(
//                         hintText: 'تاريخ نهاية النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                       onTap: () async {
//                         await _selectDate(context, endDateController);
//                       },
//                       readOnly: true,
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: maxParticipantsController,
//                       decoration: InputDecoration(
//                         hintText: 'العدد الاقصى للمشاركين',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     DropdownButtonFormField(
//                       items: notificationOptions.map((String option) {
//                         return DropdownMenuItem(
//                           value: option,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               option,
//                               style: TextStyle(
//                                 fontFamily: 'Amiri',
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           notification = value.toString();
//                         });
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'وصول الاشعارات',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: ageRangeController,
//                       decoration: InputDecoration(
//                         hintText: 'اعمار المشاركين',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     if (errorMessage.isNotEmpty)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Text(
//                           errorMessage,
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             fontSize: 18,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   child: Text(
//                     'إلغاء',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontSize: 15,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       side: BorderSide(color: Color(0xFF071533)),
//                     ),
//                   ),
//                   child: Text(
//                     'إضافة',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontSize: 15,
//                       color: Color(0xFF071533),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () async {
//                     if (nameController.text.isEmpty ||
//                         categoryController.text.isEmpty ||
//                         descriptionController.text.isEmpty ||
//                         startDateController.text.isEmpty ||
//                         endDateController.text.isEmpty ||
//                         maxParticipantsController.text.isEmpty ||
//                         notification.isEmpty ||
//                         ageRangeController.text.isEmpty) {
//                       setState(() {
//                         errorMessage = 'يرجى ملء جميع الحقول';
//                       });
//                     } else {
//                       Event newEvent = Event(
//                         id: '',
//                         date: DateTime.parse(startDateController.text),
//                         time: TimeOfDay.now(),
//                         name: nameController.text,
//                         category: categoryController.text,
//                         description: descriptionController.text,
//                         startDate: DateTime.parse(startDateController.text),
//                         endDate: DateTime.parse(endDateController.text),
//                         maxParticipants: int.parse(maxParticipantsController.text),
//                         registeredParticipants: 0,
//                         numberOfParticipants: int.parse(maxParticipantsController.text),
//                         shownToUser: false,
//                         isEditing: false,
//                         notification: notification,
//                         participantAgeRange: ageRangeController.text,
//                       );
//                       _addEvent(newEvent);
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showEditEventDialog(int index, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         Event event = events[index];
//         TextEditingController nameController =
//             TextEditingController(text: event.name);
//         TextEditingController categoryController =
//             TextEditingController(text: event.category);
//         TextEditingController descriptionController =
//             TextEditingController(text: event.description);
//         TextEditingController startDateController = TextEditingController(
//             text: event.startDate.toLocal().toString().split(' ')[0]);
//         TextEditingController endDateController = TextEditingController(
//             text: event.endDate.toLocal().toString().split(' ')[0]);
//         TextEditingController maxParticipantsController =
//             TextEditingController(text: event.maxParticipants.toString());
//         TextEditingController ageRangeController =
//             TextEditingController(text: event.participantAgeRange);
//         String notification = event.notification;
//         String errorMessage = '';

//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: Center(
//                 child: Text(
//                   'تعديل النشاط',
//                   style: TextStyle(
//                     fontFamily: 'Amiri',
//                     fontSize: 18,
//                     color: Color(0xFF071533),
//                   ),
//                 ),
//               ),
//               content: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         hintText: 'اسم النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     FutureBuilder<List<String>>(
//                       future: fetchCategories(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CircularProgressIndicator();
//                         } else if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           return DropdownButtonFormField(
//                             value: snapshot.data!.contains(event.category)
//                                 ? event.category
//                                 : null,
//                             items: snapshot.data!.map((String category) {
//                               return DropdownMenuItem(
//                                 value: category,
//                                 child: Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     category,
//                                     style: TextStyle(
//                                       fontFamily: 'Amiri',
//                                       fontSize: 12,
//                                       color: Color(0xFF071533),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               categoryController.text = value.toString();
//                             },
//                             decoration: InputDecoration(
//                               hintText: 'تصنيف النشاط',
//                               hintStyle: TextStyle(
//                                 fontFamily: 'Amiri',
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xFFffe145)),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: descriptionController,
//                       maxLines: 3,
//                       decoration: InputDecoration(
//                         hintText: 'الوصف',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: startDateController,
//                       decoration: InputDecoration(
//                         hintText: 'تاريخ بداية النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                       onTap: () async {
//                         await _selectDate(context, startDateController);
//                       },
//                       readOnly: true,
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: endDateController,
//                       decoration: InputDecoration(
//                         hintText: 'تاريخ نهاية النشاط',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                       onTap: () async {
//                         await _selectDate(context, endDateController);
//                       },
//                       readOnly: true,
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: maxParticipantsController,
//                       decoration: InputDecoration(
//                         hintText: 'العدد الاقصى للمشاركين',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     DropdownButtonFormField(
//                       value: notification.isNotEmpty ? notification : null,
//                       items: notificationOptions.map((String option) {
//                         return DropdownMenuItem(
//                           value: option,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               option,
//                               style: TextStyle(
//                                 fontFamily: 'Amiri',
//                                 fontSize: 12,
//                                 color: Color(0xFF071533),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           notification = value.toString();
//                         });
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'وصول الاشعارات',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     TextField(
//                       textAlign: TextAlign.end,
//                       cursorColor: Color(0xFFffe145),
//                       controller: ageRangeController,
//                       decoration: InputDecoration(
//                         hintText: 'اعمار المشاركين',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Amiri',
//                           fontSize: 12,
//                           color: Color(0xFF071533),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFffe145)),
//                         ),
//                       ),
//                     ),
//                     if (errorMessage.isNotEmpty)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Text(
//                           errorMessage,
//                           style: TextStyle(
//                             fontFamily: 'Amiri',
//                             fontSize: 18,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   child: Text(
//                     'إلغاء',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontSize: 15,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text(
//                     'حفظ',
//                     style: TextStyle(
//                       fontFamily: 'Amiri',
//                       fontSize: 15,
//                       color: Color(0xFF071533),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       side: BorderSide(color: Color(0xFF071533)),
//                     ),
//                   ),
//                   onPressed: () {
//                     if (nameController.text.isEmpty ||
//                         categoryController.text.isEmpty ||
//                         descriptionController.text.isEmpty ||
//                         startDateController.text.isEmpty ||
//                         endDateController.text.isEmpty ||
//                         maxParticipantsController.text.isEmpty ||
//                         notification.isEmpty ||
//                         ageRangeController.text.isEmpty) {
//                       setState(() {
//                         errorMessage = 'يرجى ملء جميع الحقول';
//                       });
//                     } else {
//                       Event updatedEvent = Event(
//                         id: event.id,
//                         date: event.date,
//                         time: event.time,
//                         name: nameController.text,
//                         category: categoryController.text,
//                         description: descriptionController.text,
//                         startDate: DateTime.parse(startDateController.text),
//                         endDate: DateTime.parse(endDateController.text),
//                         maxParticipants:
//                             int.parse(maxParticipantsController.text),
//                         registeredParticipants: event.registeredParticipants,
//                         numberOfParticipants:
//                             int.parse(maxParticipantsController.text),
//                         shownToUser: event.shownToUser,
//                         isEditing: false,
//                         notification: notification,
//                         participantAgeRange: ageRangeController.text,
//                       );
//                       _editEvent(index, updatedEvent);
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showParticipantsInfo(String eventId, BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ParticipantsInfoPage(eventId: eventId),
//       ),
//     );
//   }
// }

// class Event {
//   String id;
//   DateTime date;
//   TimeOfDay time;
//   String name;
//   String category;
//   String description;
//   DateTime startDate;
//   DateTime endDate;
//   int maxParticipants;
//   int registeredParticipants;
//   int numberOfParticipants;
//   bool shownToUser;
//   bool isEditing;
//   String notification;
//   String participantAgeRange;

//   Event({
//     required this.id,
//     required this.date,
//     required this.time,
//     required this.name,
//     required this.category,
//     required this.description,
//     required this.startDate,
//     required this.endDate,
//     required this.maxParticipants,
//     required this.registeredParticipants,
//     required this.numberOfParticipants,
//     required this.shownToUser,
//     required this.isEditing,
//     required this.notification,
//     required this.participantAgeRange,
//   });
// }


// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cytc/AdminPages/screen/MenuPages/Activities/events/EventsParticipantsView.dart';
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

///////////////////////////////
import 'package:cytc/AdminPages/screen/MenuPages/Activities/events/EventsParticipantsView.dart';
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewAddEventsPage extends StatefulWidget {
  final String userId;
  final String userRole;
  const ViewAddEventsPage(
      {Key? key, required this.userId, required this.userRole})
      : super(key: key);

  @override
  _ViewAddEventsPageState createState() => _ViewAddEventsPageState();
}

class _ViewAddEventsPageState extends State<ViewAddEventsPage> {
  List<Event> events = [];
  bool isEditing = false;
  int? editingIndex;
  List<String> categories = [];
  List<String> notificationOptions = [
    'لجميع المستخدمين',
    'للمهتمين بهذا النوع من الانشطة فقط'
  ];
  String selectedNotificationOption = 'لجميع المستخدمين';

  @override
  void initState() {
    super.initState();
    fetchEvents();
    fetchCategories().then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  Future<void> fetchEvents() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/event/all'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Event> fetchedEvents = data
          .map((item) {
            return Event(
              id: item['_id'],
              date: DateTime.parse(item['startDate']),
              time: TimeOfDay.fromDateTime(DateTime.parse(item['startDate'])),
              name: item['name'],
              category: item['interests'],
              description: item['description'],
              startDate: DateTime.parse(item['startDate']),
              endDate: DateTime.parse(item['endDate']),
              maxParticipants: item['maxParticipants'],
              registeredParticipants: item['registeredParticipants'],
              numberOfParticipants: item['maxParticipants'],
              shownToUser: false,
              isEditing: false,
              notification: '',
              participantAgeRange: item['ageRange'] ?? '',
            );
          })
          .toList()
          .cast<Event>();

      setState(() {
        events = fetchedEvents;
      });
    } else {
      print('Failed to load events');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/interest/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map<String>((item) => item['interestName'].toString())
          .toList();
    } else {
      print('Failed to load categories');
      return [];
    }
  }

  Future<void> _createEvent(
      String name,
      String startDate,
      String endDate,
      String description,
      int maxParticipants,
      String category,
      String ageRange) async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/event/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'startDate': startDate,
        'endDate': endDate,
        'description': description,
        'maxParticipants': maxParticipants,
        'interests': category,
        'ageRange': ageRange,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      fetchEvents();
    } else {
      throw Exception('Failed to create event');
    }
  }

  Future<List<String>> fetchUsers(String option, String? interest) async {
    final url = option == 'لجميع المستخدمين'
        ? 'http://localhost:9999/user/all'
        : 'http://localhost:9999/interest/users-by-interest/$interest';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (option == 'لجميع المستخدمين') {
        List<dynamic> data = json.decode(response.body);
        return data.map<String>((item) => item['_id'].toString()).toList();
      } else {
        Map<String, dynamic> data = json.decode(response.body);
        return data['users']
            .map<String>((item) => item['_id'].toString())
            .toList();
      }
    } else {
      print('Failed to load users');
      return [];
    }
  }

  Future<void> _sendNotifications(
      List<String> userIds, String title, String description) async {
    for (String userId in userIds) {
      final response = await http.post(
        Uri.parse('http://localhost:9999/notification/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': userId,
          'title': title,
          'description': description,
          'type': 'event',
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        print('Failed to send notification to user $userId');
      }
    }
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
                    builder: (context) => AdminBar(
                        userId: widget.userId, userRole: widget.userRole),
                  ),
                );
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
                              1: FlexColumnWidth(0.8),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                              7: FlexColumnWidth(1),
                              8: FlexColumnWidth(2),
                              9: FlexColumnWidth(1),
                              10: FlexColumnWidth(0.9),
                              11: FlexColumnWidth(1),
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
                                  _buildHeaderCell('المشاركين المسجلين'),
                                  _buildHeaderCell('العدد الاقصى للمشاركين'),
                                  _buildHeaderCell('ظهوره للمستخدم'),
                                  _buildHeaderCell(
                                      'تاريخ بداية وانتهاء النشاط'),
                                  _buildHeaderCell('وصول الاشعارات'),
                                  _buildHeaderCell('اعمار المشاركين'),
                                  _buildHeaderCell('تعديل'),
                                  _buildHeaderCell('الوصف'),
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
                                            event.id, context)),
                                    _buildTableCell(event.registeredParticipants
                                        .toString()),
                                    _buildTableCell(
                                        event.maxParticipants.toString()),
                                    _buildTableCell(event.shownToUser
                                        ? 'تم إظهاره للمستخدم'
                                        : ''),
                                    _buildTableCell(
                                        '${event.startDate.toLocal()}'
                                                .split(' ')[0] +
                                            ' - ' +
                                            '${event.endDate.toLocal()}'
                                                .split(' ')[0]),
                                    _buildTableCell(event.notification),
                                    _buildTableCell(event.participantAgeRange),
                                    _buildEditDeleteSaveButtons(index),
                                    _buildTableCell(event.description),
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
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Amiri',
              color: Colors.white,
              fontSize: 10,
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
          if (!events[index].shownToUser)
            IconButton(
              icon: Icon(Icons.save, color: Colors.blue),
              onPressed: () async {
                Event event = events[index];
                await _createEvent(
                  event.name,
                  event.startDate.toIso8601String(),
                  event.endDate.toIso8601String(),
                  event.description,
                  event.maxParticipants,
                  event.category,
                  event.participantAgeRange,
                );
                List<String> userIds = await fetchUsers(
                  selectedNotificationOption,
                  event.category,
                );
                await _sendNotifications(
                    userIds, event.name, event.description);
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
        TextEditingController categoryController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();
        TextEditingController startDateController = TextEditingController();
        TextEditingController endDateController = TextEditingController();
        TextEditingController maxParticipantsController =
            TextEditingController();
        TextEditingController ageRangeController = TextEditingController();
        String notification = '';
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
                    color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    FutureBuilder<List<String>>(
                      future: fetchCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DropdownButtonFormField(
                            items: snapshot.data!.map((String category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 12,
                                      color: Color(0xFF071533),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              categoryController.text = value.toString();
                            },
                            decoration: InputDecoration(
                              hintText: 'تصنيف النشاط',
                              hintStyle: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 12,
                                color: Color(0xFF071533),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFffe145)),
                              ),
                            ),
                          );
                        }
                      },
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
                          color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
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
                      controller: maxParticipantsController,
                      decoration: InputDecoration(
                        hintText: 'العدد الاقصى للمشاركين',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      value: notification.isNotEmpty ? notification : null,
                      items: notificationOptions.map((String option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              option,
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 12,
                                color: Color(0xFF071533),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'وصول الاشعارات',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: ageRangeController,
                      decoration: InputDecoration(
                        hintText: 'اعمار المشاركين',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
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
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        categoryController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        maxParticipantsController.text.isEmpty ||
                        notification.isEmpty ||
                        ageRangeController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event newEvent = Event(
                        id: '',
                        date: DateTime.parse(startDateController.text),
                        time: TimeOfDay.now(),
                        name: nameController.text,
                        category: categoryController.text,
                        description: descriptionController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        maxParticipants:
                            int.parse(maxParticipantsController.text),
                        registeredParticipants: 0,
                        numberOfParticipants:
                            int.parse(maxParticipantsController.text),
                        shownToUser: false,
                        isEditing: false,
                        notification: notification,
                        participantAgeRange: ageRangeController.text,
                      );
                      _addEvent(newEvent);

                      List<String> userIds = await fetchUsers(
                        selectedNotificationOption,
                        newEvent.category,
                      );
                      await _sendNotifications(
                          userIds, newEvent.name, newEvent.description);
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
        TextEditingController nameController =
            TextEditingController(text: event.name);
        TextEditingController categoryController =
            TextEditingController(text: event.category);
        TextEditingController descriptionController =
            TextEditingController(text: event.description);
        TextEditingController startDateController = TextEditingController(
            text: event.startDate.toLocal().toString().split(' ')[0]);
        TextEditingController endDateController = TextEditingController(
            text: event.endDate.toLocal().toString().split(' ')[0]);
        TextEditingController maxParticipantsController =
            TextEditingController(text: event.maxParticipants.toString());
        TextEditingController ageRangeController =
            TextEditingController(text: event.participantAgeRange);
        String notification = event.notification;
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
                    color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    FutureBuilder<List<String>>(
                      future: fetchCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return DropdownButtonFormField(
                            value: snapshot.data!.contains(event.category)
                                ? event.category
                                : null,
                            items: snapshot.data!.map((String category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 12,
                                      color: Color(0xFF071533),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              categoryController.text = value.toString();
                            },
                            decoration: InputDecoration(
                              hintText: 'تصنيف النشاط',
                              hintStyle: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 12,
                                color: Color(0xFF071533),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFffe145)),
                              ),
                            ),
                          );
                        }
                      },
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
                          color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
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
                          color: Color(0xFF071533),
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
                      controller: maxParticipantsController,
                      decoration: InputDecoration(
                        hintText: 'العدد الاقصى للمشاركين',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      value: notification.isNotEmpty ? notification : null,
                      items: notificationOptions.map((String option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              option,
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 12,
                                color: Color(0xFF071533),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          notification = value.toString();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'وصول الاشعارات',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.end,
                      cursorColor: Color(0xFFffe145),
                      controller: ageRangeController,
                      decoration: InputDecoration(
                        hintText: 'اعمار المشاركين',
                        hintStyle: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 12,
                          color: Color(0xFF071533),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFffe145)),
                        ),
                      ),
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
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        categoryController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty ||
                        maxParticipantsController.text.isEmpty ||
                        notification.isEmpty ||
                        ageRangeController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'يرجى ملء جميع الحقول';
                      });
                    } else {
                      Event updatedEvent = Event(
                        id: event.id,
                        date: event.date,
                        time: event.time,
                        name: nameController.text,
                        category: categoryController.text,
                        description: descriptionController.text,
                        startDate: DateTime.parse(startDateController.text),
                        endDate: DateTime.parse(endDateController.text),
                        maxParticipants:
                            int.parse(maxParticipantsController.text),
                        registeredParticipants: event.registeredParticipants,
                        numberOfParticipants:
                            int.parse(maxParticipantsController.text),
                        shownToUser: event.shownToUser,
                        isEditing: false,
                        notification: notification,
                        participantAgeRange: ageRangeController.text,
                      );
                      _editEvent(index, updatedEvent);
                      await _createEvent(
                        updatedEvent.name,
                        updatedEvent.startDate.toIso8601String(),
                        updatedEvent.endDate.toIso8601String(),
                        updatedEvent.description,
                        updatedEvent.maxParticipants,
                        updatedEvent.category,
                        updatedEvent.participantAgeRange,
                      );
                      List<String> userIds = await fetchUsers(
                        selectedNotificationOption,
                        updatedEvent.category,
                      );
                      await _sendNotifications(
                          userIds, updatedEvent.name, updatedEvent.description);
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

  void _showParticipantsInfo(String eventId, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParticipantsInfoPage(eventId: eventId),
      ),
    );
  }
}

class Event {
  String id;
  DateTime date;
  TimeOfDay time;
  String name;
  String category;
  String description;
  DateTime startDate;
  DateTime endDate;
  int maxParticipants;
  int registeredParticipants;
  int numberOfParticipants;
  bool shownToUser;
  bool isEditing;
  String notification;
  String participantAgeRange;

  Event({
    required this.id,
    required this.date,
    required this.time,
    required this.name,
    required this.category,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.maxParticipants,
    required this.registeredParticipants,
    required this.numberOfParticipants,
    required this.shownToUser,
    required this.isEditing,
    required this.notification,
    required this.participantAgeRange,
  });
}

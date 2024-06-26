// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cytc/AdminPages/screen/MenuPages/navBar.dart';
import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ParamedicsRequests extends StatelessWidget {
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
      home: ParamedicsRequestsPage(),
    );
  }
}

class ParamedicsRequestsPage extends StatefulWidget {
  @override
  _ParamedicsRequestsPageState createState() => _ParamedicsRequestsPageState();
}

class _ParamedicsRequestsPageState extends State<ParamedicsRequestsPage> {
  final List<RescueRequest> rescueRequests = [];
  final _formKey = GlobalKey<FormState>();

  String? _location;
  LatLng? _chosenLocation;
  bool _locationChosen = false;
  Map<int, bool> savedRequests = {};
  Map<int, bool> newRequests = {};

  TextEditingController _locationController = TextEditingController();
  TextEditingController _userLocationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchRescueRequests();
  }

  Future<void> _fetchRescueRequests() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/emergency/all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        rescueRequests.clear();
        for (var item in data) {
          rescueRequests.add(RescueRequest(
            announcementDate: DateTime.parse(item['dateCreation']),
            announcementTime: TimeOfDay(
              hour: int.parse(item['timeCreation'].split(':')[0]),
              minute: int.parse(item['timeCreation'].split(':')[1]),
            ),
            location: item['city'],
            userLocation: item['city'],
            chosenLocation: LatLng(
              item['location']['coordinates'][1],
              item['location']['coordinates'][0],
            ),
            isSaved: true, // Mark as saved since it's loaded from the database
          ));
          savedRequests[rescueRequests.last.hashCode] = true; // Mark as saved
        }
      });
    } else {
      throw Exception('Failed to load rescue requests');
    }
  }

  Future<List<dynamic>> _fetchParamedics() async {
    final response =
        await http.get(Uri.parse('http://localhost:9999/user/paramedics'));
    if (response.statusCode == 200) {
      final List<dynamic> paramedics = json.decode(response.body);
      return paramedics;
    } else {
      throw Exception('Failed to load paramedics');
    }
  }

  Future<void> _createNotificationForParamedics(
      List<dynamic> paramedics, String title, String description) async {
    for (var paramedic in paramedics) {
      await http.post(
        Uri.parse('http://localhost:9999/notification/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'user_id': paramedic['_id'],
          'title': title,
          'description': description,
          'type': 'emergency',
        }),
      );
    }
  }

  void _addRescueRequest() {
    setState(() {
      final newRequest = RescueRequest(
        announcementDate: DateTime.now(),
        announcementTime: TimeOfDay.now(),
        location: _location!,
        userLocation: _userLocationController.text,
        chosenLocation: _chosenLocation!,
        isSaved: false, // Mark as new and unsaved
      );
      rescueRequests.add(newRequest);
      newRequests[newRequest.hashCode] = true;
    });
  }

  Future<void> _saveNewRescueRequest(RescueRequest request) async {
    final response = await http.post(
      Uri.parse('http://localhost:9999/emergency/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'city': request.userLocation,
        'location': {
          'type': 'Point',
          'coordinates': [
            request.chosenLocation.longitude,
            request.chosenLocation.latitude
          ]
        }
      }),
    );

    if (response.statusCode == 201) {
      final paramedics = await _fetchParamedics();
      await _createNotificationForParamedics(
          paramedics,
          'مطلوب مسعفين بشكل طارئ',
          'حالة طارئة جديدة لطلب مسعفين في ${request.userLocation}');
      setState(() {
        savedRequests[request.hashCode] = true;
        newRequests[request.hashCode] = false;
      });
    } else {
      throw Exception('Failed to save rescue request');
    }
  }

  void _editRescueRequest(int index) {
    setState(() {
      rescueRequests[index] = RescueRequest(
        announcementDate: rescueRequests[index].announcementDate,
        announcementTime: rescueRequests[index].announcementTime,
        location: _location!,
        userLocation: _userLocationController.text,
        chosenLocation: _chosenLocation!,
        isSaved: rescueRequests[index].isSaved,
      );
    });
  }

  void _deleteRescueRequest(int index) {
    setState(() {
      rescueRequests.removeAt(index);
    });
  }

  Future<void> _navigateAndSelectLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ChooseLocationPage(userId: 'user_id', userRole: 'admin'),
      ),
    );

    if (result != null && result is LatLng) {
      setState(() {
        _chosenLocation = result;
        _location = '${result.latitude}, ${result.longitude}';
        _locationController.text = _location!;
        _locationChosen = true;
      });
    }
  }

  void _showAddEditDialog({RescueRequest? request, int? index}) {
    if (request != null) {
      _locationController.text = request.location;
      _userLocationController.text = request.userLocation;
      _chosenLocation = request.chosenLocation;
      _locationChosen = true;
    } else {
      _locationController.clear();
      _userLocationController.clear();
      _chosenLocation = null;
      _locationChosen = false;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            request == null
                ? 'قم باضافة حالة طوارئ جديدة'
                : 'قم بتعديل حالة الطوارئ',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Amiri',
                color: Color(0xFF071533),
                fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _userLocationController,
                  decoration: InputDecoration(
                    hintText: 'ادخل اسم المكان',
                    hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontSize: 12,
                        fontFamily: 'Amiri'),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Amiri',
                      color: Color(0xFF071533)),
                  validator: (value) =>
                      value!.isEmpty ? 'قم بتحديد اسم الموقع' : null,
                  onChanged: (value) => _location = value,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'احداثيات الموقع على الخارطة',
                    hintStyle: TextStyle(
                        color: Color(0xFF071533),
                        fontSize: 12,
                        fontFamily: 'Amiri'),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Amiri',
                      color: Color(0xFF071533)),
                  readOnly: true,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => _navigateAndSelectLocation(context),
                      child: Row(
                        children: [
                          if (_locationChosen)
                            Icon(Icons.check, color: Colors.green),
                          Text(
                            'قم بتحديد الموقع على الخارطة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFffe145),
                              decoration: TextDecoration.underline,
                              fontFamily: 'Amiri',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'رجوع',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (index == null) {
                    _addRescueRequest();
                  } else {
                    _editRescueRequest(index);
                  }
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded edges
                  side: BorderSide(color: Color(0xFF071533)),
                ),
              ),
              child: Text(
                'حفظ',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  color: Color(0xFF071533),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool canEditOrDelete(DateTime announcementDate, TimeOfDay announcementTime) {
    final now = DateTime.now();
    final announcementDateTime = DateTime(
      announcementDate.year,
      announcementDate.month,
      announcementDate.day,
      announcementTime.hour,
      announcementTime.minute,
    );
    return now.difference(announcementDateTime).inHours < 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            backgroundColor: Color(0xFF071533),
            title: Center(
                child: Text(
                  '(اضافة حالة طوارئ جديدة (طلب مسعفين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            actions: [
              IconButton(
              icon: Icon(
                LineAwesomeIcons.angle_right_solid,
                color: Colors.white,
                size: 25,
              ),
               onPressed: (){
                 Navigator.push( 
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminBar(userId: '', userRole: '')));
              }, 
            ),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () => _showAddEditDialog(), // Show dialog directly
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(color: Color(0xFF071533)),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFFe0e0e0)),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الظهور عند المستخدم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تعديل',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الاحداثيات على الخريطة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الموقع',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'الوقت',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تاريخ الاضافة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF071533),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...rescueRequests.map((request) {
                    final canEdit = canEditOrDelete(
                        request.announcementDate, request.announcementTime);
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              savedRequests.containsKey(request.hashCode) &&
                                      savedRequests[request.hashCode]!
                                  ? 'تم اظهاره للمستخدم'
                                  : '',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 4.0,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 17,
                                    color: Color(0xFFffe145),
                                  ),
                                  onPressed: canEdit
                                      ? () => _showAddEditDialog(
                                          request: request,
                                          index:
                                              rescueRequests.indexOf(request))
                                      : null,
                                  color: canEdit ? Colors.blue : Colors.grey,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 17,
                                  ),
                                  onPressed: canEdit
                                      ? () => _deleteRescueRequest(
                                          rescueRequests.indexOf(request))
                                      : null,
                                  color: canEdit ? Colors.red : Colors.grey,
                                ),
                                if (newRequests.containsKey(request.hashCode) &&
                                    newRequests[request.hashCode]!)
                                  IconButton(
                                    icon: Icon(
                                      Icons.save,
                                      size: 17,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      _saveNewRescueRequest(request);
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${request.chosenLocation.latitude}, ${request.chosenLocation.longitude}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              request.userLocation,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              request.announcementTime.format(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(request.announcementDate),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF071533),
                                  fontFamily: 'Amiri'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RescueRequest {
  final String location;
  final String userLocation;
  final DateTime announcementDate;
  final TimeOfDay announcementTime;
  final LatLng chosenLocation;
  final bool isSaved;

  RescueRequest({
    required this.location,
    required this.userLocation,
    required this.announcementDate,
    required this.announcementTime,
    required this.chosenLocation,
    required this.isSaved,
  });
}

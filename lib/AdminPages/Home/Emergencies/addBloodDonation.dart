// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BloodRequests extends StatelessWidget {
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
      home: BloodRequestsPage(),
    );
  }
}

class BloodRequestsPage extends StatefulWidget {
  @override
  _BloodRequestsPageState createState() => _BloodRequestsPageState();
}

class _BloodRequestsPageState extends State<BloodRequestsPage> {
  final List<RescueRequest> rescueRequests = [];
  final _formKey = GlobalKey<FormState>();

  String? _hospitalName;
  String? _bloodType;
  int? _unitsRequired;
  bool _locationChosen = false;
  Map<int, bool> savedRequests = {};

  TextEditingController _hospitalNameController = TextEditingController();
  TextEditingController _unitsRequiredController = TextEditingController();

  void _addRescueRequest() {
    setState(() {
      rescueRequests.add(
        RescueRequest(
          hospitalName: _hospitalName!,
          bloodType: _bloodType!,
          unitsRequired: _unitsRequired!,
          announcementDate: DateTime.now(),
          announcementTime: TimeOfDay.now(),
        ),
      );
    });
  }

  void _editRescueRequest(int index) {
    setState(() {
      rescueRequests[index] = RescueRequest(
        hospitalName: _hospitalName!,
        bloodType: _bloodType!,
        unitsRequired: _unitsRequired!,
        announcementDate: rescueRequests[index].announcementDate,
        announcementTime: rescueRequests[index].announcementTime,
      );
    });
  }

  void _deleteRescueRequest(int index) {
    setState(() {
      rescueRequests.removeAt(index);
    });
  }

  void _showAddEditDialog({RescueRequest? request, int? index}) {
    if (request != null) {
      _hospitalNameController.text = request.hospitalName;
      _unitsRequiredController.text = request.unitsRequired.toString();
      _bloodType = request.bloodType;
    } else {
      _hospitalNameController.clear();
      _unitsRequiredController.clear();
      _bloodType = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            request == null ? 'إضافة طلب جديد' : 'تعديل الطلب',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Amiri',
              color: Color(0xFF071533),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _hospitalNameController,
                  decoration: InputDecoration(
                    hintText: 'اسم المستشفى',
                    hintStyle: TextStyle(
                      color: Color(0xFF071533),
                      fontSize: 12,
                      fontFamily: 'Amiri',
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Amiri',
                    color: Color(0xFF071533),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'يرجى إدخال اسم المستشفى' : null,
                  onChanged: (value) => _hospitalName = value,
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _unitsRequiredController,
                  decoration: InputDecoration(
                    hintText: 'عدد وحدات الدم المطلوبة',
                    hintStyle: TextStyle(
                      color: Color(0xFF071533),
                      fontSize: 12,
                      fontFamily: 'Amiri',
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  cursorColor: Color(0xFFffe145),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Amiri',
                    color: Color(0xFF071533),
                  ),
                  validator: (value) => value!.isEmpty
                      ? 'يرجى إدخال عدد وحدات الدم المطلوبة'
                      : null,
                  onChanged: (value) =>
                      _unitsRequired = int.tryParse(value) ?? 0,
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _bloodType,
                  decoration: InputDecoration(
                    hintText: 'نوع فصيلة الدم',
                    hintStyle: TextStyle(
                      color: Color(0xFF071533),
                      fontSize: 12,
                      fontFamily: 'Amiri',
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFffe145)),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF071533),
                    fontSize: 12,
                    fontFamily: 'Amiri',
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'A+',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'A+',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'A-',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'A-',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'B+',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'B+',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'B-',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'B-',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'AB+',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'AB+',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'AB-',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'AB-',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'O+',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'O+',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'O-',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'O-',
                            style: TextStyle(
                              color: Color(0xFF071533),
                              fontSize: 12,
                              fontFamily: 'Amiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _bloodType = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'يرجى اختيار نوع فصيلة الدم' : null,
                  iconSize: 24,
                  isExpanded: true,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded edges
                ),
              ),
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
            actions: [
              Center(
                child: Text(
                  '(إضافة حالة طوارئ جديدة (طلب وحدات دم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
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
                  6: FlexColumnWidth(1),
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
                            'عدد وحدات الدم المطلوبة',
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
                            'نوع فصيلة الدم',
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
                            'اسم المستشفى',
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
                            'التاريخ',
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
                                if (!savedRequests
                                        .containsKey(request.hashCode) ||
                                    !savedRequests[request.hashCode]!)
                                  IconButton(
                                    icon: Icon(
                                      Icons.save,
                                      size: 17,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        savedRequests[request.hashCode] = true;
                                      });
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
                              request.unitsRequired.toString(),
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
                              request.bloodType,
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
                              request.hospitalName,
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
  final String hospitalName;
  final String bloodType;
  final int unitsRequired;
  final DateTime announcementDate;
  final TimeOfDay announcementTime;

  RescueRequest({
    required this.hospitalName,
    required this.bloodType,
    required this.unitsRequired,
    required this.announcementDate,
    required this.announcementTime,
  });
}
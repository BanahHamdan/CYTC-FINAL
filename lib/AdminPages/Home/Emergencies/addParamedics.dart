import 'package:cytc/UserPages/screen/Emergencies/chooseeLocation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParamedicsRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF071533),
        fontFamily: 'Amiri',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
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
  int? _paramedics;
  String? _dangerLevel;
  LatLng? _chosenLocation;

  TextEditingController _locationController = TextEditingController();
  TextEditingController _paramedicsController = TextEditingController();
  TextEditingController _dangerLevelController = TextEditingController();

  void _addRescueRequest() {
    setState(() {
      rescueRequests.add(
        RescueRequest(
          location: _location!,
          paramedics: _paramedics!,
          announcementDate: DateTime.now(),
          announcementTime: TimeOfDay.now(),
          dangerLevel: _dangerLevel!,
          chosenLocation: _chosenLocation!,
        ),
      );
    });
  }

  void _editRescueRequest(int index) {
    setState(() {
      rescueRequests[index] = RescueRequest(
        location: _location!,
        paramedics: _paramedics!,
        announcementDate: rescueRequests[index].announcementDate,
        announcementTime: rescueRequests[index].announcementTime,
        dangerLevel: _dangerLevel!,
        chosenLocation: _chosenLocation!,
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
        builder: (context) => ChooseLocationPage(userId: 'user_id', userRole: 'admin'),
      ),
    );

    if (result != null && result is LatLng) {
      setState(() {
        _chosenLocation = result;
        _location = 'Location chosen'; // or any other meaningful string representation of the location
        _showAddEditDialog(); // Automatically show the add/edit dialog after choosing location
      });
    }
  }

  void _showAddEditDialog({RescueRequest? request, int? index}) {
    if (request != null) {
      _locationController.text = request.location;
      _paramedicsController.text = request.paramedics.toString();
      _dangerLevelController.text = request.dangerLevel;
      _chosenLocation = request.chosenLocation;
    } else {
      _locationController.clear();
      _paramedicsController.clear();
      _dangerLevelController.clear();
      _chosenLocation = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(request == null ? 'Add Rescue Request' : 'Edit Rescue Request'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) => value!.isEmpty ? 'Please enter a location' : null,
                  onChanged: (value) => _location = value,
                ),
                TextFormField(
                  controller: _paramedicsController,
                  decoration: InputDecoration(labelText: 'Paramedics'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Please enter the number of paramedics' : null,
                  onChanged: (value) => _paramedics = int.tryParse(value),
                ),
                TextFormField(
                  controller: _dangerLevelController,
                  decoration: InputDecoration(labelText: 'Danger Level'),
                  validator: (value) => value!.isEmpty ? 'Please enter the danger level' : null,
                  onChanged: (value) => _dangerLevel = value,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _navigateAndSelectLocation(context),
                      child: Text('Choose Location on Map'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
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
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
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
      appBar: AppBar(
        title: Text('Admin Rescue Requests'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _navigateAndSelectLocation(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Paramedics')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Danger Level')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: List.generate(
                  rescueRequests.length,
                  (index) {
                    final request = rescueRequests[index];
                    final canEdit = canEditOrDelete(request.announcementDate, request.announcementTime);
                    return DataRow(cells: [
                      DataCell(Text(request.location)),
                      DataCell(Text(request.paramedics.toString())),
                      DataCell(Text(DateFormat.yMMMd().format(request.announcementDate))),
                      DataCell(Text(request.announcementTime.format(context))),
                      DataCell(Text(request.dangerLevel)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: canEdit ? () => _showAddEditDialog(request: request, index: index) : null,
                            color: canEdit ? Colors.blue : Colors.grey,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: canEdit ? () => _deleteRescueRequest(index) : null,
                            color: canEdit ? Colors.red : Colors.grey,
                          ),
                          IconButton(
                            icon: Icon(Icons.save),
                            onPressed: () {
                              // Save functionality (optional, implement as needed)
                            },
                          ),
                        ],
                      )),
                    ]);
                  },
                ),
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
  final int paramedics;
  final DateTime announcementDate;
  final TimeOfDay announcementTime;
  final String dangerLevel;
  final LatLng chosenLocation;

  RescueRequest({
    required this.location,
    required this.paramedics,
    required this.announcementDate,
    required this.announcementTime,
    required this.dangerLevel,
    required this.chosenLocation,
  });
}

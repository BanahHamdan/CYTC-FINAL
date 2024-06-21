// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewSuggestionsPage extends StatefulWidget {
  @override
  _ViewSuggestionsPageState createState() => _ViewSuggestionsPageState();
}

class _ViewSuggestionsPageState extends State<ViewSuggestionsPage> {
  List<Suggestion> suggestions = [];

  @override
  void initState() {
    super.initState();
    fetchSuggestions();
  }

  Future<void> fetchSuggestions() async {
    final String apiUrl = "http://localhost:9999/suggestions";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Suggestion> fetchedSuggestions = data.map((item) => Suggestion.fromJson(item)).toList();

      setState(() {
        suggestions = fetchedSuggestions;
      });
    } else {
      // Handle the error
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
        backgroundColor: Colors.white,
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
                        Text(
                          'اقتراحات المستخدمين',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF071533),
                            fontSize: 18,
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
                                  _buildHeaderCell('الوصف'),
                                  _buildHeaderCell('عنوان الاقتراح'),
                                  _buildHeaderCell('البريد الإلكتروني'),
                                  _buildHeaderCell('اسم المستخدم'),
                                ],
                              ),
                              ...suggestions.map((suggestion) {
                                return TableRow(
                                  children: [
                                    _buildTableCell(suggestion.description),
                                    _buildTableCell(suggestion.title),
                                    _buildTableCell(suggestion.email),
                                    _buildTableCell(suggestion.name),
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
}

class Suggestion {
  final String name;
  final String email;
  final String title;
  final String description;

  Suggestion({
    required this.name,
    required this.email,
    required this.title,
    required this.description,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      name: json['fullName'],
      email: json['email'],
      title: json['title'],
      description: json['description'],
    );
  }
}

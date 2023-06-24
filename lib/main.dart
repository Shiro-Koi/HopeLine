import 'package:flutter/material.dart';
import 'package:hope_line/applicationConstants.dart';
import 'package:hope_line/initial_screen.dart';
import 'package:hope_line/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HopeLine());
}

class HopeLine extends StatefulWidget {
  const HopeLine({Key? key}) : super(key: key);

  @override
  _HopeLineState createState() => _HopeLineState();
}

class _HopeLineState extends State<HopeLine> {
  late Widget _initialRoute = const Scaffold();

  @override
  void initState() {
    super.initState();
    checkExistingFiles();
  }

  void checkExistingFiles() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String liteDataFilePath = '${appDocumentsDirectory.path}/lite_data.json';
    String fullDataFilePath = '${appDocumentsDirectory.path}/full_data.json';

    bool liteDataFileExists = await File(liteDataFilePath).exists();
    bool fullDataFileExists = await File(fullDataFilePath).exists();

    if (liteDataFileExists || fullDataFileExists) {
      setState(() {
        _initialRoute = const HomeScreen();
      });
    } else {
      setState(() {
        _initialRoute = const InitialScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HopeLine',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: _initialRoute,
    );
  }
}

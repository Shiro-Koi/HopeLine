// basic immediate help screen

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:convert';
import 'dart:io';
// path provider
import 'package:path_provider/path_provider.dart';

class ImmediateHelp extends StatelessWidget {
  ImmediateHelp({Key? key}) : super(key: key);
  
  void sendSMS(BuildContext context) async {
    //TODO: add the message to be sent to the emergency contacts
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Immediate Help')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/checkmark.png", height: 150, width: 150),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Help is on the way, Don\'t worry.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

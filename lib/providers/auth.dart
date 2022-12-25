import 'dart:convert';
import 'dart:io';

import 'package:dry_cleaning/screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? countryCode;
  String? phone;
  String? verificationId;  
}

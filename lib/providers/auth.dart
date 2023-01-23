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
  String Id='';
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> phoneAuthentication(String phonenumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          var errorMsg = "phone number is invalid";
        } else {
          var errorMsg = "phone number is invalid";
        }
      },
      codeSent: (verificationId, resendToken) {
        this.Id = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.Id = verificationId;
      },
    );
    notifyListeners();
  }

  Future<UserCredential> verifyOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: Id.toString(), smsCode: otp);
    var credentials = await auth.signInWithCredential(credential);
    final credentialsdata = json.decode(credentials.user as String);
    print(credentialsdata);
    notifyListeners();
    return credentialsdata;
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  String get id {
    return Id.toString();
  }
}

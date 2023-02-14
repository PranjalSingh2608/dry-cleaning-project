import 'dart:io';
import 'dart:math';

import 'package:dry_cleaning/providers/auth.dart';
import 'package:dry_cleaning/providers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import 'Verify_screen.dart';

class AuthScreen extends StatefulWidget {
  //static const routeName = '/auth';
  String verify = "";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  var countryCode = new TextEditingController();
  var phone = new TextEditingController();
  Map<String, String> authData = {
    'countryCode': '',
    'phone': '',
  };
  var _isLoading = false;
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: Text('An Error Occured!'),
              content: Text(msg),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Okay')),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.5),
                  Colors.white.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Text(
                                  'Phone Number Verification',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                child: Text(
                                  '(Please provide your phone number for otp verification)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        controller: countryCode,
                                        decoration: InputDecoration(
                                            hintText: '+XX',
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter a your Country Code';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          authData['countryCode'] = value!;
                                          Provider.of<Auth>(context)
                                              .countryCode = value.toString();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: phone,
                                        decoration: InputDecoration(
                                            hintText: 'Phone',
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 10) {
                                            return 'Enter a your valid Phone Number';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          authData['phone'] = value!;
                                          Provider.of<Auth>(context).phone =
                                              value.toString();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              if (_isLoading)
                                CircularProgressIndicator()
                              else
                                InkWell(
                                  onTap: () async {
                                    if (await Vibrate.canVibrate) {
                                      Vibration.vibrate(duration: 100);
                                    } 
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber:
                                          '${countryCode.text + phone.text}',
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {},
                                      codeSent: (String verificationId,
                                          int? resendToken) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VerifyScreen(
                                                id: verificationId),
                                          ),
                                        );
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 120,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "VERIFY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.withOpacity(0.5),
                                            Colors.white.withOpacity(0.98),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [0, 1],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

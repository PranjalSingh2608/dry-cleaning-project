import 'package:dry_cleaning/screens/Auth_acreen.dart';
import 'package:dry_cleaning/screens/Home_screen.dart';
import 'package:dry_cleaning/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
      ),
      initialRoute:'/auth',
      routes: {
        MyRoutes.AuthRoute: ((context) => AuthScreen()),
        MyRoutes.HomeRoute: ((context) => HomeScreen()),
      },
    );
  }
}


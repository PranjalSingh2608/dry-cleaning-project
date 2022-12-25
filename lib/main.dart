import 'package:dry_cleaning/providers/auth.dart';
import 'package:dry_cleaning/screens/Auth_screen.dart';
import 'package:dry_cleaning/screens/Home_screen.dart';
import 'package:dry_cleaning/screens/Verify_screen.dart';
import 'package:dry_cleaning/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
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
          home: AuthScreen(),
          routes: {
            MyRoutes.AuthRoute: (context) => AuthScreen(),
            MyRoutes.HomeRoute: (context) => HomeScreen(),
            MyRoutes.VerifyRoute:(context) => VerifyScreen(),
          },
        ),
      ),
    );
  }
}

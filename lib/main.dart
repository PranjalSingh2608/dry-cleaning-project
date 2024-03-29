import 'package:dry_cleaning/providers/auth.dart';
import 'package:dry_cleaning/providers/bag.dart';
import 'package:dry_cleaning/providers/cart.dart';
import 'package:dry_cleaning/providers/dry_clean.dart';
import 'package:dry_cleaning/providers/jacket.dart';
import 'package:dry_cleaning/providers/order.dart';
import 'package:dry_cleaning/providers/premium_dry_clean.dart';
import 'package:dry_cleaning/providers/shoe.dart';
import 'package:dry_cleaning/providers/steamIron.dart';
import 'package:dry_cleaning/providers/storedata.dart';
import 'package:dry_cleaning/screens/Auth_screen.dart';
import 'package:dry_cleaning/screens/Home_screen.dart';
import 'package:dry_cleaning/screens/Order_screen.dart';
import 'package:dry_cleaning/screens/cartSelection_screen.dart';
import 'package:dry_cleaning/screens/Profile_screen.dart';
import 'package:dry_cleaning/screens/Rate_screen.dart';
import 'package:dry_cleaning/screens/Verify_screen.dart';
import 'package:dry_cleaning/screens/WashIronRate_screen.dart';
import 'package:dry_cleaning/screens/WashfoldRate_screen.dart';
import 'package:dry_cleaning/screens/cart_screen.dart';
import 'package:dry_cleaning/screens/dryCleanRate_screen.dart';
import 'package:dry_cleaning/screens/map_screen.dart';
import 'package:dry_cleaning/screens/miscRate_screen.dart';
import 'package:dry_cleaning/screens/organicDryCleanRate_screen.dart';
import 'package:dry_cleaning/screens/specialserviceRate_screen.dart';
import 'package:dry_cleaning/screens/steamIronRate_screen.dart';
import 'package:dry_cleaning/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
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
        ChangeNotifierProvider(create: (create) => Auth()),
        ChangeNotifierProvider(create: (context) => DryCleans()),
        ChangeNotifierProvider(create: (create) => Cart()),
        ChangeNotifierProvider(create: (context) => PremiumDryCleans()),
        ChangeNotifierProvider(create: (context) => Jackets()),
        ChangeNotifierProvider(create: (context) => Shoes()),
        ChangeNotifierProvider(create: (context) => Bags()),
        ChangeNotifierProvider(create: (context) => SteamIrons()),
        ChangeNotifierProvider(create: (context) => StoreData.empty()),
        ChangeNotifierProvider(create: (context) => Order(),child: PlaceOrder(),),
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
          initialRoute:
              FirebaseAuth.instance.currentUser != null ? '/home' : '/auth',
          routes: {
            MyRoutes.AuthRoute: (context) => AuthScreen(),
            MyRoutes.HomeRoute: (context) => HomeScreen(),
            MyRoutes.ProfileRoute: (context) => ProfileScreen(),
            //MyRoutes.VerifyRoute:(context) => VerifyScreen(),
            MyRoutes.RateRoute: (context) => RateScreen(),
            MyRoutes.DryCleanRateRoute: (context) => DryCleanRate(),
            MyRoutes.OrganicDryCleanRateRoute: (context) =>
                OrganicDryCleanRate(),
            MyRoutes.MiscRateRoute: (context) => MiscRate(),
            MyRoutes.WashIronRateRoute: (context) => WashIron(),
            MyRoutes.WashFoldRateRoute: (context) => WashFold(),
            MyRoutes.SpecialServiceRateRoute: (context) => SpecialService(),
            MyRoutes.SteamIronRateRoute: (context) => SteamIronRate(),
            MyRoutes.MapRoute: ((context) => MapScreen()),
            MyRoutes.OrderRoute: ((context) => OrderScreen()),
            MyRoutes.CartRoute: ((context) => CartScreen()),
            MyRoutes.PlaceOrderRoute: ((context) => PlaceOrder()),
          },
        ),
      ),
    );
  }
}

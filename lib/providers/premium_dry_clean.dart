import 'package:flutter/cupertino.dart';

class PremiumDryClean with ChangeNotifier {
  PremiumDryClean(this.name, this.price);
  final String name;
  final int count = 1;
  final double price;
}
class PremiumDryCleans with ChangeNotifier{
  
  List<PremiumDryClean> dailyWear = [
    PremiumDryClean('SHIRT', 169),
    PremiumDryClean('T-SHIRT', 169),
    PremiumDryClean('LADIES TOP',169),
    PremiumDryClean('TROUSER', 219),
    PremiumDryClean('JEANS', 219),
    PremiumDryClean('SKIRT(HALF)', 169),
    PremiumDryClean('SKIRT(FULL)', 329),
    PremiumDryClean('DRESS', 329),
    PremiumDryClean('DRESS(DESIGNER)', 430),
    PremiumDryClean('JUMPSUIT', 359),
    PremiumDryClean('GOWN(PLAIN)', 509),
    PremiumDryClean('GOWN(MEDIUM)', 699),
    PremiumDryClean('GOWN(HEAVY)', 870),
    PremiumDryClean('KIDS DRESS', 199),
    PremiumDryClean('BEDSHEET(S)', 139),
    PremiumDryClean('BEDSHEET(D)', 249),
    PremiumDryClean('BED COVER', 329),
    PremiumDryClean('PILLOW COVER', 89),
    PremiumDryClean('CUSHION COVER', 89),
  ];
  List<PremiumDryClean> ethnicWear = [
    PremiumDryClean('PAYJAMA/SALWAR/LEGGING', 159),
    PremiumDryClean('PLAZO PLAIN', 169),
    PremiumDryClean('PLAZO HEAVY', 349),
    PremiumDryClean('KURTA/KAMEEZ', 169),
    PremiumDryClean('SAREE', 339),
    PremiumDryClean('SAREE M/H',649),
    PremiumDryClean('GENTS SHERWANI',959),
    PremiumDryClean('LEHNGA/GHAGRA(LIGHT)',1049),
    PremiumDryClean('LEHNGA/GHAGRA(MEDIUM)', 1829),
    PremiumDryClean('LEHNGA HEAVY(BRIDAL)', 2879),
    PremiumDryClean('CHOLI', 169),
  ];
  List<PremiumDryClean> winterWear = [
    PremiumDryClean('SWEAT-SHIRT', 179),
    PremiumDryClean('SWEATER-HALF', 169),
    PremiumDryClean('SWEATER-FULL', 219),
    PremiumDryClean('WAIST COAT', 260),
    PremiumDryClean('COAT', 349),
    PremiumDryClean('OVER COAT', 439),
    PremiumDryClean('JACKET(HALF)',329),
    PremiumDryClean('JACKET(FULL)',399),
    PremiumDryClean('SHAWL',389),
    PremiumDryClean('SHAWL FANCY/PASHMINA', 640),
  ];
}
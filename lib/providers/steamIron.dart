import 'package:flutter/cupertino.dart';

class SteamIron with ChangeNotifier{
  final String name;
  final int count = 1;
  final double price;

  SteamIron(this.name, this.price);
}

class SteamIrons with ChangeNotifier {
  List<SteamIron> dailyWear = [
    SteamIron('SHIRT', 39),
    SteamIron('T-SHIRT', 39),
    SteamIron('LADIES TOP', 50),
    SteamIron('TROUSER', 50),
    SteamIron('JEANS', 59),
    SteamIron('SKIRT(HALF)', 70),
    SteamIron('SKIRT(FULL)', 109),
    SteamIron('DRESS', 89),
    SteamIron('DRESS(DESIGNER)', 149),
    SteamIron('JUMPSUIT', 79),
    SteamIron('GOWN(PLAIN)', 159),
    SteamIron('GOWN(MEDIUM)', 209),
    SteamIron('GOWN(HEAVY)', 319),
    SteamIron('KIDS DRESS', 50),
  ];
  List<SteamIron> ethnicWear = [
    SteamIron('PAYJAMA/SALWAR/LEGGING', 39),
    SteamIron('PLAZO PLAIN', 59),
    SteamIron('PLAZO HEAVY', 119),
    SteamIron('KURTA/KAMEEZ', 50),
    SteamIron('BLOUSE', 39),
    SteamIron('SAREE', 109),
    SteamIron('SAREE M/H', 179),
    SteamIron('GENTS SHERWANI', 249),
    SteamIron('LEHNGA/GHAGRA(LIGHT)', 269),
    SteamIron('LEHNGA HEAVY(BRIDAL)', 729),
    SteamIron('CHOLI', 50),
  ];
  List<SteamIron> winterWear = [
    SteamIron('SWEAT-SHIRT', 79),
    SteamIron('SWEATER-HALF', 59),
    SteamIron('SWEATER-FULL', 89),
    SteamIron('WAIST COAT', 79),
    SteamIron('COAT', 109),
    SteamIron('OVER COAT', 199),
    SteamIron('JACKET(HALF)', 99),
    SteamIron('JACKET(FULL)', 109),
    SteamIron('SHAWL', 109),
    SteamIron('SHAWL FANCY/PASHMINA', 159),
  ];
  List<SteamIron> miscellaneous = [
    SteamIron('BEDSHEET(S)', 59),
    SteamIron('BEDSHEET(D)', 109),
    SteamIron('BED COVER', 129),
    SteamIron('PILLOW COVER', 34),
    SteamIron('CUSHION COVER', 39),
    SteamIron('CURTAIN WINDOW', 79),
    SteamIron('CURTAIN WINDOW LINING', 99),
    SteamIron('CURTAIN DOOR', 109),
    SteamIron('CURTAIN DOOR LINING', 139),
    SteamIron('CURTAIN CEILING', 149),
    SteamIron('CURTAIN CEILING LINING', 199),
    SteamIron('CURTAIN NET', 109),
  ];
}

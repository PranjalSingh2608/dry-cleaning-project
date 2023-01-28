import 'package:flutter/cupertino.dart';

class SteamIron with ChangeNotifier {
  final String id;
  final String name;
  final int count = 1;
  final double price;

  SteamIron(this.id,this.name, this.price);
}

class SteamIrons with ChangeNotifier {
  List<SteamIron> dailyWear = [
    SteamIron('sidw1','SHIRT', 39),
    SteamIron('sidw2','T-SHIRT', 39),
    SteamIron('sidw3','LADIES TOP', 50),
    SteamIron('sidw4','TROUSER', 50),
    SteamIron('sidw5','JEANS', 59),
    SteamIron('sidw6','SKIRT(HALF)', 70),
    SteamIron('sidw7','SKIRT(FULL)', 109),
    SteamIron('sidw8','DRESS', 89),
    SteamIron('sidw9','DRESS(DESIGNER)', 149),
    SteamIron('sidw10','JUMPSUIT', 79),
    SteamIron('sidw11','GOWN(PLAIN)', 159),
    SteamIron('sidw12','GOWN(MEDIUM)', 209),
    SteamIron('sidw13','GOWN(HEAVY)', 319),
    SteamIron('sidw14','KIDS DRESS', 50),
  ];
  List<SteamIron> ethnicWear = [
    SteamIron('siew1','PAYJAMA/SALWAR/LEGGING', 39),
    SteamIron('siew2','PLAZO PLAIN', 59),
    SteamIron('siew3','PLAZO HEAVY', 119),
    SteamIron('siew4','KURTA/KAMEEZ', 50),
    SteamIron('siew5','BLOUSE', 39),
    SteamIron('siew6','SAREE', 109),
    SteamIron('siew7','SAREE M/H', 179),
    SteamIron('siew8','GENTS SHERWANI', 249),
    SteamIron('siew9','LEHNGA/GHAGRA(LIGHT)', 269),
    SteamIron('siew10','LEHNGA HEAVY(BRIDAL)', 729),
    SteamIron('siew11','CHOLI', 50),
  ];
  List<SteamIron> winterWear = [
    SteamIron('siww1','SWEAT-SHIRT', 79),
    SteamIron('siww2','SWEATER-HALF', 59),
    SteamIron('siww3','SWEATER-FULL', 89),
    SteamIron('siww4','WAIST COAT', 79),
    SteamIron('siww5','COAT', 109),
    SteamIron('siww6','OVER COAT', 199),
    SteamIron('siww7','JACKET(HALF)', 99),
    SteamIron('siww8','JACKET(FULL)', 109),
    SteamIron('siww9','SHAWL', 109),
    SteamIron('siww10','SHAWL FANCY/PASHMINA', 159),
  ];
  List<SteamIron> miscellaneous = [
    SteamIron('sim1','BEDSHEET(S)', 59),
    SteamIron('sim2','BEDSHEET(D)', 109),
    SteamIron('sim3','BED COVER', 129),
    SteamIron('sim4','PILLOW COVER', 34),
    SteamIron('sim5','CUSHION COVER', 39),
    SteamIron('sim6','CURTAIN WINDOW', 79),
    SteamIron('sim7','CURTAIN WINDOW LINING', 99),
    SteamIron('sim8','CURTAIN DOOR', 109),
    SteamIron('sim9','CURTAIN DOOR LINING', 139),
    SteamIron('sim10','CURTAIN CEILING', 149),
    SteamIron('sim11','CURTAIN CEILING LINING', 199),
    SteamIron('sim12','CURTAIN NET', 109),
  ];
}

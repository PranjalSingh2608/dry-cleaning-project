import 'package:flutter/cupertino.dart';

class PremiumDryClean with ChangeNotifier {
  PremiumDryClean(this.id,this.name, this.price);
  final String id;
  final String name;
  final int count = 0;
  final double price;
}
class PremiumDryCleans with ChangeNotifier{
  
  List<PremiumDryClean> dailyWear = [
    PremiumDryClean('pdcdw1','SHIRT', 169),
    PremiumDryClean('pdcdw2','T-SHIRT', 169),
    PremiumDryClean('pdcdw3','LADIES TOP',169),
    PremiumDryClean('pdcdw4','TROUSER', 219),
    PremiumDryClean('pdcdw5','JEANS', 219),
    PremiumDryClean('pdcdw6','SKIRT(HALF)', 169),
    PremiumDryClean('pdcdw7','SKIRT(FULL)', 329),
    PremiumDryClean('pdcdw8','DRESS', 329),
    PremiumDryClean('pdcdw9','DRESS(DESIGNER)', 430),
    PremiumDryClean('pdcdw10','JUMPSUIT', 359),
    PremiumDryClean('pdcdw11','GOWN(PLAIN)', 509),
    PremiumDryClean('pdcdw12','GOWN(MEDIUM)', 699),
    PremiumDryClean('pdcdw13','GOWN(HEAVY)', 870),
    PremiumDryClean('pdcdw14','KIDS DRESS', 199),
    PremiumDryClean('pdcdw15','BEDSHEET(S)', 139),
    PremiumDryClean('pdcdw16','BEDSHEET(D)', 249),
    PremiumDryClean('pdcdw17','BED COVER', 329),
    PremiumDryClean('pdcdw18','PILLOW COVER', 89),
    PremiumDryClean('pdcdw19','CUSHION COVER', 89),
  ];
  List<PremiumDryClean> ethnicWear = [
    PremiumDryClean('pdcew1','PAYJAMA/SALWAR/LEGGING', 159),
    PremiumDryClean('pdcew2','PLAZO PLAIN', 169),
    PremiumDryClean('pdcew3','PLAZO HEAVY', 349),
    PremiumDryClean('pdcew4','KURTA/KAMEEZ', 169),
    PremiumDryClean('pdcew5','SAREE', 339),
    PremiumDryClean('pdcew6','SAREE M/H',649),
    PremiumDryClean('pdcew7','GENTS SHERWANI',959),
    PremiumDryClean('pdcew8','LEHNGA/GHAGRA(LIGHT)',1049),
    PremiumDryClean('pdcew9','LEHNGA/GHAGRA(MEDIUM)', 1829),
    PremiumDryClean('pdcew10','LEHNGA HEAVY(BRIDAL)', 2879),
    PremiumDryClean('pdcew11','CHOLI', 169),
  ];
  List<PremiumDryClean> winterWear = [
    PremiumDryClean('pdcww1','SWEAT-SHIRT', 179),
    PremiumDryClean('pdcww2','SWEATER-HALF', 169),
    PremiumDryClean('pdcww3','SWEATER-FULL', 219),
    PremiumDryClean('pdcww4','WAIST COAT', 260),
    PremiumDryClean('pdcww5','COAT', 349),
    PremiumDryClean('pdcww6','OVER COAT', 439),
    PremiumDryClean('pdcww7','JACKET(HALF)',329),
    PremiumDryClean('pdcww8','JACKET(FULL)',399),
    PremiumDryClean('pdcww9','SHAWL',389),
    PremiumDryClean('pdcww10','SHAWL FANCY/PASHMINA', 640),
  ];
}
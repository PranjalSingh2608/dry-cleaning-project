import 'package:flutter/cupertino.dart';

class DryClean with ChangeNotifier{
  final String id;
  final String name;
  final int count = 0;
  final double price;

  DryClean(this.id,this.name, this.price);
}

class DryCleans with ChangeNotifier {
  List<DryClean> dailyWear = [
    DryClean('dcdw1','SHIRT', 89),
    DryClean('dcdw2','T-SHIRT', 89),
    DryClean('dcdw3','LADIES TOP', 119),
    DryClean('dcdw4','TROUSER', 109),
    DryClean('dcdw5','JEANS', 109),
    DryClean('dcdw6','SKIRT(HALF)', 119),
    DryClean('dcdw7','SKIRT(FULL)', 249),
    DryClean('dcdw8','DRESS', 219),
    DryClean('dcdw9','DRESS(DESIGNER)', 309),
    DryClean('dcdw10','JUMPSUIT', 260),
    DryClean('dcdw11','GOWN(PLAIN)', 349),
    DryClean('dcdw12','GOWN(MEDIUM)', 430),
    DryClean('dcdw13','GOWN(HEAVY)', 620),
    DryClean('dcdw14','KIDS DRESS', 129),
  ];
  List<DryClean> ethnicWear = [
    DryClean('dcew1','PAYJAMA/SALWAR/LEGGING', 89),
    DryClean('dcew2','PLAZO PLAIN', 109),
    DryClean('dcew3','PLAZO HEAVY', 260),
    DryClean('dcew4','KURTA/KAMEEZ', 109),
    DryClean('dcew5','BLOUSE', 79),
    DryClean('dcew6','SAREE', 229),
    DryClean('dcew7','SAREE M/H', 339),
    DryClean('dcew8','GENTS SHERWANI', 489),
    DryClean('dcew9','LEHNGA/GHAGRA(LIGHT)', 549),
    DryClean('dcew10','LEHNGA/GHAGRA(MEDIUM)', 809),
    DryClean('dcew11','LEHNGA HEAVY(BRIDAL)', 1949),
    DryClean('dcew12','CHOLI', 109),
  ];
  List<DryClean> winterWear = [
    DryClean('dcww1','SWEAT-SHIRT', 169),
    DryClean('dcww2','SWEATER-HALF', 129),
    DryClean('dcww3','SWEATER-FULL', 179),
    DryClean('dcww4','WAIST COAT', 169),
    DryClean('dcww5','COAT', 219),
    DryClean('dcww6','OVER COAT', 399),
    DryClean('dcww7','JACKET(HALF)', 189),
    DryClean('dcww8','JACKET(FULL)', 229),
    DryClean('dcww9','SHAWL', 209),
    DryClean('dcww10','SHAWL FANCY/PASHMINA', 349),
    DryClean('dcww11','BLANKET AC/SMALL', 229),
    DryClean('dcww12','BLANKET AC/LARGE', 299),
    DryClean('dcww13','COMFORTER', 309),
    DryClean('dcww14','BLANKET(S)', 309),
    DryClean('dcww15','BLANKET(D)', 399),
    DryClean('dcww16','RAJAI(S)', 329),
    DryClean('dcww17','RAJAI(D)', 399),
  ];
  List<DryClean> miscellaneous = [
    DryClean('dcm1','BEDSHEET(S)', 129),
    DryClean('dcm2','BEDSHEET(D)', 209),
    DryClean('dcm3','BED COVER', 260),
    DryClean('dcm4','PILLOW COVER', 59),
    DryClean('dcm5','CUSHION COVER', 79),
    DryClean('dcm6','CURTAIN WINDOW', 149),
    DryClean('dcm7','CURTAIN WINDOW LINING', 179),
    DryClean('dcm8','CURTAIN DOOR', 229),
    DryClean('dcm9','CURTAIN DOOR LINING', 269),
    DryClean('dcm10','CURTAIN CEILING', 299),
    DryClean('dcm11','CURTAIN CEILING LINING', 399),
    DryClean('dcm12','CURTAIN NET', 209),
  ];

}

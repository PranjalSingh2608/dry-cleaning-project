import 'package:flutter/cupertino.dart';

class DryClean with ChangeNotifier {
  final String name;
  final int count = 1;
  final double price;

  DryClean(this.name, this.price);
  List<DryClean> dailyWear = [
    DryClean('SHIRT', 89),
    DryClean('T-SHIRT', 89),
    DryClean('LADIES TOP', 119),
    DryClean('TROUSER', 109),
    DryClean('JEANS', 109),
    DryClean('SKIRT(HALF)', 119),
    DryClean('SKIRT(FULL)', 249),
    DryClean('DRESS', 219),
    DryClean('DRESS(DESIGNER)', 309),
    DryClean('JUMPSUIT', 260),
    DryClean('GOWN(PLAIN)', 349),
    DryClean('GOWN(MEDIUM)', 430),
    DryClean('GOWN(HEAVY)', 620),
    DryClean('KIDS DRESS', 129),
  ];
  List<DryClean> ethnicWear = [
    DryClean('PAYJAMA/SALWAR/LEGGING', 89),
    DryClean('PLAZO PLAIN', 109),
    DryClean('PLAZO HEAVY', 260),
    DryClean('KURTA/KAMEEZ', 109),
    DryClean('BLOUSE', 79),
    DryClean('SAREE', 229),
    DryClean('SAREE M/H', 339),
    DryClean('GENTS SHERWANI', 489),
    DryClean('LEHNGA/GHAGRA(LIGHT)', 549),
    DryClean('LEHNGA/GHAGRA(MEDIUM)', 809),
    DryClean('LEHNGA HEAVY(BRIDAL)', 1949),
    DryClean('CHOLI', 109),
  ];
  List<DryClean> winterWear = [
    DryClean('SWEAT-SHIRT', 169),
    DryClean('SWEATER-HALF', 129),
    DryClean('SWEATER-FULL', 179),
    DryClean('WAIST COAT', 169),
    DryClean('COAT', 219),
    DryClean('OVER COAT', 399),
    DryClean('JACKET(HALF)', 189),
    DryClean('JACKET(FULL)', 229),
    DryClean('SHAWL', 209),
    DryClean('SHAWL FANCY/PASHMINA', 349),
    DryClean('BLANKET AC/SMALL', 229),
    DryClean('BLANKET AC/LARGE', 299),
    DryClean('COMFORTER', 309),
    DryClean('BLANKET(S)', 309),
    DryClean('BLANKET(D)', 399),
    DryClean('RAJAI(S)', 329),
    DryClean('RAJAI(D)', 399),
  ];
  List<DryClean> miscellaneous = [
    DryClean('BEDSHEET(S)', 129),
    DryClean('BEDSHEET(D)', 209),
    DryClean('BED COVER', 260),
    DryClean('PILLOW COVER', 59),
    DryClean('CUSHION COVER', 79),
    DryClean('CURTAIN WINDOW', 149),
    DryClean('CURTAIN WINDOW LINING', 179),
    DryClean('CURTAIN DOOR', 229),
    DryClean('CURTAIN DOOR LINING', 269),
    DryClean('CURTAIN CEILING', 299),
    DryClean('CURTAIN CEILING LINING', 399),
    DryClean('CURTAIN NET', 209),
  ];
}

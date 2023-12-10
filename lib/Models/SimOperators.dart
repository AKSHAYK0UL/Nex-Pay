import 'package:flutter/material.dart';

class SimOperators {
  String OperatorName;
  String OperatorImage;
  SimOperators({required this.OperatorName, required this.OperatorImage});
}

class SimOperatorsData with ChangeNotifier {
  List<SimOperators> OperatorsInfo = [
    SimOperators(
        OperatorName: 'Airtel Prepaid', OperatorImage: 'simImage/art.png'),
    SimOperators(
        OperatorName: 'Jio prepaid', OperatorImage: 'simImage/jio.png'),
    SimOperators(
        OperatorName: 'VI Prepaid', OperatorImage: 'simImage/videa.png'),
    SimOperators(
        OperatorName: 'Bsnl prepaid', OperatorImage: 'simImage/bl.png'),
  ];
  List<SimOperators> get getOPINFO {
    return [...OperatorsInfo];
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/SimOperators.dart';

class SimOperatorsWidget extends StatelessWidget {
  const SimOperatorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final simoperator = Provider.of<SimOperatorsData>(context);
    return Column(
      children: [
        ...simoperator.getOPINFO
            .map(
              (e) => ListTile(
                horizontalTitleGap: 20,
                minVerticalPadding: 30,
                leading: CircleAvatar(
                  radius: 25,
                  child: Image.asset(e.OperatorImage),
                ),
                title: Text(e.OperatorName),
              ),
            )
            .toList(),
      ],
    );
  }
}

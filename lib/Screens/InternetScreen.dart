import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/NetworkModel.dart';
import 'BottomNavBarWidget.dart';
import 'NoInternetScreen.dart';

class InternetScreen extends StatefulWidget {
  static const routeName = 'InternetScreen';
  const InternetScreen({super.key});

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<NetworkModel>(context).checkInternetConnection;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checkconnection = Provider.of<NetworkModel>(context);

    return checkconnection.isinternet
        ? BottomNavBarWidget()
        : NointernetScreen();
  }
}

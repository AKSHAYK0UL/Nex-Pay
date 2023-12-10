import 'package:flutter/material.dart';
import 'package:payment_app/Screens/HomeScreen.dart';

import 'AllTransactionScreen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;
  List<Widget> Screens = [];
  @override
  void initState() {
    // TODO: implement initState
    Screens = [
      HomeScreen(),
      AllTransactionScreeen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Text(
          _currentIndex == 0 ? "Nex Pay" : "Transaction history",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey.shade200,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        elevation: 20,
        onTap: (value) {
          setState(
            () {
              _currentIndex = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            // backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Transactions",
            // backgroundColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

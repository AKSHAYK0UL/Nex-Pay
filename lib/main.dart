import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payment_app/Models/NetworkModel.dart';
import 'package:payment_app/Screens/InternetScreen.dart';
import 'package:payment_app/Screens/PaytoContactsScreen.dart';
import 'package:payment_app/Screens/TransactionFailedScreen.dart';
import 'package:provider/provider.dart';
import 'Models/ContactsModel.dart';
import 'Models/PayOrRequestModel.dart';
import 'Models/SimOperators.dart';
import 'Models/UpiPinModel.dart';
import 'Screens/AddAmountScreen.dart';
import 'Screens/AmountOfPayToContacts.dart';
import 'Screens/IntroductionScreen.dart';
import 'Screens/MobileRechargeScreen.dart';
import 'Screens/PaytoContactsTransactionScreen.dart';
import 'Screens/ProcessingScreen.dart';
import 'Screens/TransactionDoneScreen.dart';
import 'Screens/UpiPinScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PayAmountAdapter());
  await Hive.openBox('transdone');
  await Hive.openBox('firsttime');
  // FlutterNativeSplash.removeAfter(initialization);
  await Future.delayed(
    const Duration(seconds: 2),
    () {
      FlutterNativeSplash.remove();
    },
  );
  runApp(const PaymentHome());
}

// Future initialization(BuildContext context) async {
//   await Future.delayed(const Duration(seconds: 2));
// }

class PaymentHome extends StatelessWidget {
  const PaymentHome({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NetworkModel()),
        ChangeNotifierProvider(
          create: (context) => ContactsModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimOperatorsData(),
        ),
        ChangeNotifierProvider(
          create: (context) => PayAmountModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpiPin(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Colors.white,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        home: Hive.box('firsttime').isEmpty
            ? IntroductionScreen()
            : InternetScreen(),
        routes: {
          PaytoContactsScreen.routeName: (context) =>
              const PaytoContactsScreen(),
          MobileRechargeScreen.routeName: (context) =>
              const MobileRechargeScreen(),
          AmountOfPayToContacts.routeName: (context) =>
              const AmountOfPayToContacts(),
          AddAmountScreen.routeName: (context) => AddAmountScreen(),
          ProcessingScreenWidget.routeName: (context) =>
              const ProcessingScreenWidget(),
          UpiPinScreen.routeName: (context) => UpiPinScreen(),
          PaytoContactsTransactionScreen.routeName: (context) =>
              const PaytoContactsTransactionScreen(),
          TransactionDoneScreen.routeName: (context) =>
              const TransactionDoneScreen(),
          TransactionFailedScreen.routeName: (context) =>
              const TransactionFailedScreen(),
          InternetScreen.routeName: (context) => InternetScreen(),
        },
      ),
    );
  }
}

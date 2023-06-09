import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rrconstruction/screens/average.dart';
import 'package:rrconstruction/screens/homeScreen.dart';
import 'package:rrconstruction/screens/maintenance.dart';
import 'package:rrconstruction/screens/tyre.dart';
import 'package:rrconstruction/screens/vehicleOptionsList.dart';
import 'package:rrconstruction/screens/welcomescreen.dart';
import 'screens/loginScreen.dart';
import 'screens/registrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
final auth = FirebaseAuth.instance;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: auth.currentUser == null ? WelcomeScreen.wid : HomeScreen.hid,
      routes: {
        WelcomeScreen.wid: (context) => WelcomeScreen(),
        LoginScreen.lid: (context) => LoginScreen(),
        RegistrationScreen.rid: (context) => RegistrationScreen(),
        HomeScreen.hid: (context) => HomeScreen(),
        Average.aid : (context) => Average(),
        Tyre.tid : (context) => Tyre(),
        Maintenance.mid : (context) => Maintenance(),
        OptionsScreen.vid : (context) => OptionsScreen(),
      },
    );
  }
}
//Todo : format of saving in firebase and improve ui

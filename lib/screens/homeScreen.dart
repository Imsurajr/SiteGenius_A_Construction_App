import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrconstruction/screens/vehicleOptionsList.dart';
import 'package:rrconstruction/constants.dart';
import 'package:rrconstruction/screens/welcomescreen.dart';

List<String> vehicles = ["Vehicle 1", "Vehicle 2", "Vehicle 3"];
TextEditingController _addNewVehicleController = TextEditingController();

class HomeScreen extends StatefulWidget {
  static const String hid = "homescreen_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        primary: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: Text(
                          'Cancel',
                          style: kButtonTextStyle.copyWith(color: Colors.teal),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Logout',
                            style:
                                kButtonTextStyle.copyWith(color: Colors.teal)),
                        onPressed: () {
                          final auth = FirebaseAuth.instance;
                          auth.signOut();
                          // Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(
                              context, WelcomeScreen.wid);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Vehicle Information'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
        child: Column(
         children: [
           Expanded(
             child: ListView.builder(
               physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
               itemCount: vehicles.length,
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                   color: kOutlineColor,
                   margin: EdgeInsets.symmetric(vertical: 6),
                   child: Card(
                     color: kButtonColor,
                     elevation: 10,
                     child: Padding(
                       padding: EdgeInsets.all(4.0),
                       child: ListTile(
                         contentPadding: EdgeInsets.all(4),
                         title: Text(
                           vehicles[index],
                           textAlign: TextAlign.center,
                           style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600),
                         ),
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => OptionsScreen(),
                             ),
                           );
                         },
                       ),
                     ),
                   ),
                 );
               },
             ),
           ),
           FloatingActionButton(
             onPressed: () {
               _display(context);
             },
             backgroundColor: Colors.white70,
             child: Icon(Icons.add , size: 35, color: Colors.black87,),
           ),
         ],
          ),
      ),
    );
  }

  Future<dynamic> _display(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kButtonColor,
            title: Text(
              "Add New Vehicle",
              style: kButtonTextStyle.copyWith(color: Colors.white , fontSize: 20),
            ),
            content: TextField(
              controller: _addNewVehicleController,
              style: TextStyle(
                color:Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('ADD'),
                onPressed: () {
                  _addNewVehicleController.clear();
                  Navigator.of(context).pop();
                  String newVehicle = (_addNewVehicleController.text);
                  setState(() {
                    vehicles.add(newVehicle);
                  });
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('CANCEL'),
                onPressed: () {
                  _addNewVehicleController.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         title: Text("Vehicle Information"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 itemCount: vehicles.length,
//                 prototypeItem: ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => VehicleOptionsList(),
//                       ),
//                     );
//                   },
//                   title: Text(vehicles.first),
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Text(
//                     (vehicles[index]),
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

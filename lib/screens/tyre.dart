import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrconstruction/constants.dart';

class Tyre extends StatefulWidget {


  static const String tid = "tyre_screen";

  TextEditingController _addInformationTitle = TextEditingController();
  TextEditingController _addInformationDesc = TextEditingController();
  List<String> TI = ['1/01/12', '1/31/12', '12/11/22'];
  List<String> TID = [
    'Tyre changed 1 long description',
    'Tyre changed 2 long description',
    'Tyre changed 3 long description'
  ];

  @override
  State<Tyre> createState() => _TyreState();
}

class _TyreState extends State<Tyre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text(
          "Tyre Information",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              itemCount: widget.TI.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: kOutlineColor,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    color: kButtonColor,
                    child: ListTile(
                      title: Text(widget.TI[index] , style: kButtonTextStyle,),
                      subtitle: Text(widget.TID[index], style: kButtonTextStyle.copyWith(fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              onPressed: () {
                _display(context);
              },
              backgroundColor: Colors.white70,
              child: Icon(Icons.add , size: 35, color: Colors.black87,),
            ),
          )
        ],
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
              "Add New Tyre Information",
              style: TextStyle(color: Colors.white , fontSize:  20),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: widget._addInformationTitle,
                  decoration: InputDecoration(
                      hintText: "Date",
                      // labelText: "Date",
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            // widget._addInformationTitle;
                            widget._addInformationTitle.text = DateFormat.yMd().format(date);
                          }
                        },
                        child: Icon(Icons.calendar_today),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: widget._addInformationDesc,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Add long Description",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  String newInformation = widget._addInformationTitle.text;
                  String description = widget._addInformationDesc.text;
                  setState(() {
                    widget.TI.add(newInformation);
                    widget.TID.add(description);
                  });
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kBackgroundColor),
                ),
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}

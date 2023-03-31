import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper(this.url);
  String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode==200)
      {
        String data = response.body;
        return jsonDecode(data);
      }
    else
      {
        return Container(
          child: Center(child: Text("An error occured ${response.statusCode}" ,
          style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.w500),
          )),
        );
      }
  }
}
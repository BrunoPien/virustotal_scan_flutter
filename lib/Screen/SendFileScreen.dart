import 'package:flutter/material.dart';
import 'package:virustotalscan/Request/Data.dart';

class SendFileScreen extends StatefulWidget {
  _SendFileScreenState createState() => _SendFileScreenState();
}

class _SendFileScreenState extends State<SendFileScreen> {
  
  
 Data _data = Data();

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Virus Total Flutter"),
         ),
         body: xTeste()
       ),
    );
  }

  Widget xTeste(){
    return FlatButton(
      onPressed: () {_data.xSendUrlScan();},
      child: Text("click"),
    );
  }
}
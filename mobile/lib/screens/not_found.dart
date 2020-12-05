import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.grey.shade50, leading: IconButton(icon: Icon(Feather.chevron_left, color: Colors.black,), onPressed: () => Navigator.of(context).pop() ),),
      backgroundColor: Colors.grey.shade50,
      body: Center(child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: 1/0,
        height: 1/0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Feather.alert_octagon, size: 48, color: Colors.black45,),
          SizedBox(height: 10),
          Text('Cuidado!', style: TextStyle(fontSize: 24, color: Colors.black45, fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Text('O app está em construção, algumas funções não foram feitas ainda! 😉', style: TextStyle(fontSize: 20, color: Colors.grey), textAlign: TextAlign.center,),
        ],),
      ),),
    );
  }
}

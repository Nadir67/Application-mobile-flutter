import 'package:flutter/material.dart';
import './main-drawer.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('My APP'),backgroundColor: Colors.deepPurpleAccent,),
      body: Center(child:
        Text('Application Flutter Nadir', style: TextStyle(fontSize: 24,color: Colors.black),),),

    );

  }

}
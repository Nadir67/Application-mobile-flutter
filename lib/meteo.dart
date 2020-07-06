import 'package:flutter/material.dart';
import 'package:flutterapp/meteo-details.dart';
class Meteo extends StatefulWidget {
  @override
  _MeteoState createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {
  String city="";
  TextEditingController textEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigoAccent,title: Text(city),),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Taper une commune '),
                style: TextStyle(fontSize: 22),
                onChanged: (value){
                  setState(() {
                    this.city=value;
                  });
                },
                onSubmitted: (value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MeteoDetails(city)));
                  textEditingController.text="";
                },
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MeteoDetails(city)));
                    textEditingController.text="";
                  },
                  color: Colors.brown,
                  child: Text('Get Meteo...', style: TextStyle(fontSize: 22,color: Colors.white),),

          ),
              ))
        ],
      )
    );
  }
}

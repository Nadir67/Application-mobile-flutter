import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MeteoDetails extends StatefulWidget {
  String city = "";

  MeteoDetails(this.city);

  @override
  _MeteoDetailsState createState() => _MeteoDetailsState();
}

class _MeteoDetailsState extends State<MeteoDetails> {

  var meteoData;
  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  getData(String city){
    print("Getting meteo of "+city);
    String url="https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=3f324bb8a392ac1ec013ff485e7fcb83&units=Imperial";
    http.get(url)
    .then((resp){
      setState(() {
        this.meteoData=json.decode(resp.body);
        print(this.meteoData);
      });
    }).catchError((err){
      print (err);

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meteo de commun ${widget.city}'),
        backgroundColor: Colors.blueGrey,
      ),
        body: (meteoData==null? Center(child: CircularProgressIndicator(),):
            ListView.builder(
                itemCount: (meteoData==null?0:meteoData['list'].length),
                itemBuilder: (context,index){
                  return Card(
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         Row(
                           children: <Widget>[
                             CircleAvatar(
                               backgroundImage: AssetImage
                                 ("images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children:<Widget>[
                                   Text("${new DateFormat('E-dd/MM/yyyy')
                                       .format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt']*1000000))}",
                                     style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold),
                                   ),
                                   Text("${new DateFormat('HH:mm')
                                       .format(DateTime.fromMicrosecondsSinceEpoch(
                                       meteoData['list'][index]['dt']*1000000))} "
                                     " ⎥ ${meteoData['list'][index]['weather'][0]['main']}",
                                     style:
                                     TextStyle(fontSize: 22,color: Colors.white, fontWeight:
                                     FontWeight.bold),
                                   ),
                                 ],
                               ),
                             )
                           ],
                         ),
                          Text("${meteoData['list'][index]['main']['temp'].round()} F"
                            ,style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold ),),
                        

                        ],
                      ),
                    ),
                  );

                }
            )

        )

    );
  }
}

import 'package:flutter/material.dart';
import './quiz.dart';
import './meteo.dart';
import './gallery.dart';
import './camera.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.red])),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Quiz',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Quiz()));
            },
          ),
          Divider(
            color: Colors.deepOrange,
          ),
          ListTile(
            title: Text(
              'Meteo',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Meteo()));
            },
          ),
          Divider(
            color: Colors.deepOrange,
          ),
          ListTile(
            title: Text(
              'Galley',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gallery()));
            },
          ),
          Divider(
            color: Colors.deepOrange,
          ),
          ListTile(
            title: Text(
              'Camera',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraPage()));
            },
          )
        ],
      ),
    );
  }
}

import 'package:ceapp/model/Disciplina.dart';
import 'package:ceapp/ui/CeAppPage.dart';
import 'package:ceapp/ui/CronogramaPage.dart';
import 'package:ceapp/ui/DisciplinasPage.dart';
import 'package:flutter/material.dart';

class CeBottomNavigation extends StatefulWidget {
  @override
  _CeBottomNavigationState createState() => _CeBottomNavigationState();
}

class _CeBottomNavigationState extends State<CeBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.orange,
        // height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[



            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {


                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CronogramaPage()));


              },
            ),




            IconButton(
              icon: Icon(Icons.school),
              color: Colors.white,
              onPressed: () {


                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DisciplinasPage()));

              },
            ),






            IconButton(
              icon: Icon(Icons.show_chart),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CeAppPage()));
              },
            )
          ],
        ));
  }
}



import 'package:ceapp/ui/estatisticas_page.dart';
import 'package:ceapp/ui/cronograma_page.dart';
import 'package:ceapp/ui/disciplinas_page.dart';
import 'package:flutter/material.dart';

class CeBottomNavigation extends StatefulWidget {
  @override
  _CeBottomNavigationState createState() => _CeBottomNavigationState();
}

class _CeBottomNavigationState extends State<CeBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.indigoAccent,
        // height: 60.0,
        padding: EdgeInsets.only(left: 10,right: 10),


        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[


            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CronogramaPage()));
              },

              padding: EdgeInsets.all(8.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.home, color: Colors.white,),
                  Text("Início", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15.0))
                ],
              ),
            ),


            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DisciplinasPage()));
              },

              padding: EdgeInsets.all(8.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.school, color: Colors.white,),
                  Text("Disciplinas", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15.0),)
                ],
              ),
            ),



            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => EstatisticasPage()));
              },

              padding: EdgeInsets.all(8.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.pie_chart, color: Colors.white,),
                  Text("Estatísticas", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15.0),)
                ],
              ),
            ),


          ],
        ));
  }
}


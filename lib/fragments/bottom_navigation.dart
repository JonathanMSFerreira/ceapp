
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
    return  Card(
        color: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[


            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CronogramaPage()));
              },


           icon:       Icon(Icons.home, color: Colors.indigoAccent,),


            ),


            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DisciplinasPage()));
              },


            icon: Icon(Icons.school, color: Colors.indigoAccent,),

            ),



            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => EstatisticasPage()));
              },



                icon: Icon(Icons.show_chart, color: Colors.indigoAccent,),

            ),


          ],
        ));
  }
}


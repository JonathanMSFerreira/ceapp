
import 'package:ceapp/ui/estatisticas_page.dart';
import 'package:ceapp/ui/cronograma_page.dart';
import 'package:ceapp/ui/disciplinas_page.dart';
import 'package:flutter/material.dart';

class CeBottomNavigation extends StatefulWidget {


   int option;
  CeBottomNavigation(int option){

    this.option = option;

  }

  @override
  _CeBottomNavigationState createState() => _CeBottomNavigationState(option);


}

class _CeBottomNavigationState extends State<CeBottomNavigation> {

  int  option;

  _CeBottomNavigationState(option){

    this.option = option;

  }





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
              onPressed: this.option == 1 ? null: ()  {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CronogramaPage()));
              } ,


           icon:   Icon(Icons.home, color:  this.option == 1 ? Colors.grey[350]: Colors.indigoAccent),


            ),


            IconButton(
              onPressed: this.option == 2 ? null : () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DisciplinasPage()));
              },


            icon: Icon(Icons.school, color: this.option == 2 ? Colors.grey[350] : Colors.indigoAccent),

            ),



            IconButton(
              onPressed:this.option == 3 ? null : () {
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => EstatisticasPage()));
              },



                icon: Icon(Icons.show_chart, color: this.option == 3 ? Colors.grey[350] : Colors.indigoAccent),

            ),


          ],
        ));
  }
}


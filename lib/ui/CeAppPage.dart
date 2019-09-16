import 'package:ceapp/ui/tabsDisciplinaPage/EstatiticasContent.dart';
import 'package:ceapp/ui/tabsDisciplinaPage/HomeContent.dart';
import 'package:ceapp/ui/util/Background.dart';
import 'package:flutter/material.dart';
import 'CronogramaPage.dart';


class CeAppPage extends StatefulWidget {
  @override
  _CeAppPageState createState() => _CeAppPageState();
}

class _CeAppPageState extends State<CeAppPage> {
  DateTime date1;
  DateTime date2;
  DateTime date3;

  final background = Background();


  int _currentIndex = 0;

  final List<Widget> _children = [


    HomeContent(),


   CronogramaPage(),

    EstatisticasContent(),

   /*CronometroContent(),*/
  ];




  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text("Ciclo de Estudos"),

          actions: <Widget>[

            IconButton( icon: Icon(Icons.clear), onPressed: (){


              _showDialog(context);



            })


          ],


        ),
    /*    floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new NewCePage()));
          },
          child: Icon(Icons.add),
        ),*/
        drawer: _ceDrawer(),

        bottomNavigationBar: BottomNavigationBar(

          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(

              icon: new Icon(Icons.home),
              title: new Text('Início'),
            ),

    BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today), title: Text('Cronograma')),
            BottomNavigationBarItem(
              icon: new Icon(Icons.show_chart),
              title: new Text('Estatísticas'),


            ),

          ],
        ),


        body:_children[_currentIndex]
/*
        body: Container(
          color: Colors.deepPurple,
          child: _contCe(context),

        )
    */
    );
  }
}


/*
**********WIDGETS**************
*/

Widget _ceDrawer() {
  return Drawer(


    child:  Stack(


      children: <Widget>[

        Container(color: Colors.indigoAccent,),


        ListView(


          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(

              accountName: Text("Jonathan Ferreira"),
              accountEmail: Text("jmontsf@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                child: Text("EC"),
              ),
            ),
            ListTile(
              title: Text(
                'Ciclos de estudos',
                style: TextStyle(color: Colors.indigo),
              ),
              leading: Icon(Icons.all_inclusive, color: Colors.indigo),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              title: Text('Cronograma',
                  style: TextStyle(color: Colors.indigo)),
              leading: Icon(Icons.access_time, color: Colors.indigo),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              title: Text('Compartilhe',
                  style: TextStyle(color: Colors.indigo)),
              leading: Icon(Icons.share, color: Colors.indigo),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              title: Text("Sair", style: TextStyle(color: Colors.indigo)),
              leading:
              Icon(Icons.power_settings_new, color: Colors.indigo),
            )
          ],
        )

      ],


    )





    ,
  );
}

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(

        backgroundColor: Colors.indigo,
        title: new Text(
          "Remover ciclo de estudo",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text("Os dados serão apagados!", style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              "Cancelar",
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          new FlatButton(
            child: new Text("Sim", style: TextStyle(color: Colors.white),),
            shape: CircleBorder(),

            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}




import 'package:ceapp/ui/tabsDisciplinaPage/EstatiticasContent.dart';
import 'package:ceapp/ui/tabsDisciplinaPage/HomeContent.dart';
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



  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeContent(),
    CronogramaPage(),
    //EstatisticasContent(),

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
          title: Text("Receita Federal", style: TextStyle(color: Colors.indigo),),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
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


          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          onTap: onTabTapped, // new
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: new Icon(Icons.home),
              title: new Text('Início'),
            ),
            BottomNavigationBarItem(

                backgroundColor: Colors.grey,
                icon: Icon(Icons.calendar_today), title: Text('Cronograma')),
       /*     BottomNavigationBarItem(
              backgroundColor: Colors.grey,

              icon: new Icon(Icons.show_chart),
              title: new Text('Estatísticas'),
            ),*/
          ],
        ),
        body:

          _children[_currentIndex]


        );
  }
}

/*
**********WIDGETS**************
*/

Widget _ceDrawer() {
  return Drawer(
    child: Stack(
      children: <Widget>[
        Container(
          color: Colors.indigo,
        ),
        ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[


            UserAccountsDrawerHeader(
              accountName: Text("Jonathan Ferreira", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              accountEmail: Text("jmontsf@gmail.com", style: TextStyle(color: Colors.grey),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,size: 50.0, color: Colors.white,),
              ),
            ),
            ListTile(
              title: Text(
                'Ciclos de estudos',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.all_inclusive, color: Colors.white),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(color: Colors.white,),
            ListTile(
              title: Text('Cronograma', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.access_time, color: Colors.white),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(color: Colors.white,),
            ListTile(
              title:
                  Text('Compartilhe', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.share, color: Colors.white),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(color: Colors.white,),

            ListTile(
              title: Text("Sair", style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.power_settings_new, color: Colors.white),
            )
          ],
        )
      ],
    ),
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
          "Remover ciclo de estudo ?",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text(
          "Os dados serão apagados!",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              "Cancelar",
              style: TextStyle(color: Colors.grey[300]),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          new FlatButton(
            child: new Text(
              "Sim",
              style: TextStyle(color: Colors.white),
            ),
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

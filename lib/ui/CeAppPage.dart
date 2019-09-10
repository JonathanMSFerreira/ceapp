import 'package:ceapp/ui/util/Background.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CeCalendar.dart';
import 'MateriaPage.dart';
import 'NewCePage.dart';

class CeAppPage extends StatefulWidget {
  @override
  _CeAppPageState createState() => _CeAppPageState();
}

class _CeAppPageState extends State<CeAppPage> {
  DateTime date1;
  DateTime date2;
  DateTime date3;

  final background = Background();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Minha Vaga"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new NewCePage()));
          },
          child: Icon(Icons.add),
        ),
        drawer: _ceDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Início'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Mensagens'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Minha conta'))
          ],
        ),
        body: Container(
          child: _cardCe(context),
        ));
  }
}

/*
**********MÉTODOS AUXILIARES**************
*/

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          "Remover ciclo de estudo",
          style: TextStyle(color: Colors.deepPurple),
        ),
        content:
            new Text("Remover TJMA?\nTodos os dados serão apagados! "),
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
            child: new Text("Sim"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

/*
**********WIDGETS**************
*/

Widget _ceDrawer() {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
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
          title: Text('Ciclos de estudos', style: TextStyle(color: Colors.deepPurpleAccent),),
          leading: Icon(Icons.all_inclusive,color: Colors.deepPurpleAccent),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        Divider(),
        ListTile(
          title: Text('Cronograma', style: TextStyle(color: Colors.deepPurpleAccent)),
          leading: Icon(Icons.access_time, color: Colors.deepPurpleAccent),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        Divider(),
        ListTile(
          title: Text('Compartilhe', style: TextStyle(color: Colors.deepPurpleAccent)),
          leading: Icon(Icons.share, color: Colors.deepPurpleAccent),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        Divider(),

        ListTile(
          title: Text("Sair",style: TextStyle(color: Colors.deepPurpleAccent)),
          leading: Icon(Icons.power_settings_new , color: Colors.deepPurpleAccent),
        )
      ],
    ),
  );
}

Widget _cardCe(BuildContext context) {
  return Card(
    elevation: 8.0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(


          isThreeLine: true,
         // leading: Icon(Icons.border_color, color: Colors.deepPurple,),
          title: Text('Liceu Maranhense', style: TextStyle(fontSize: 20.0),),
          subtitle: Text('Inicio: 09/09/2019\nFim: 09/12/2019'),
          trailing: Text("10 matérias", style: TextStyle(color: Colors.yellow),),
        ),

        Divider(),
        ButtonTheme.bar(





          // make buttons use the appropriate styles for cards
          child: ButtonBar(

            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              FlatButton(
                child: const Text(
                  'Remover',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  _showDialog(context);
                },
              ),

              FlatButton(
                child: const Text(
                  'Disciplinas',
                  style: TextStyle(color: Colors.deepPurple),
                ),
                onPressed: () {



                },
              ),

              FlatButton(
                child: const Text('Gerenciar'),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CeCalendar()));
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

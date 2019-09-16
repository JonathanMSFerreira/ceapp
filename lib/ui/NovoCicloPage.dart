import 'package:flutter/material.dart';

import 'CeAppPage.dart';

class NovoCicloPage extends StatefulWidget {
  @override
  _NovoCicloPageState createState() => _NovoCicloPageState();
}

class _NovoCicloPageState extends State<NovoCicloPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.edit)),
                Tab(icon: Icon(Icons.calendar_today)),
                Tab(icon: Icon(Icons.school)),
              ],
            ),
            title: Text('Novo Ciclo de Estudos'),
            centerTitle: true,
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: () {

            },
            child: Icon(Icons.check),
          ),

          body: TabBarView(

            children: [
              _dadosGerais(context),
              _disciplinas(context),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _dadosGerais(BuildContext context) {
  return Tab(

      child: SingleChildScrollView(
        child: Center(
            child: Container(
                padding: EdgeInsets.only( left: 30.0, right: 30.0),
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nome do ciclo'),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Início do ciclo'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Fim do ciclo'),
                      ),


                    ]))),
      ));
}


Widget _disciplinas(BuildContext context){


  return Tab(

      child: SingleChildScrollView(

            child: Container(
              padding: EdgeInsets.all(20),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[

                      Expanded(child: TextField(

                      ), ),

                      RaisedButton(

                        child: Text("Adicionar"),

                      )
                    ],
                  )
                ],
              )
            ),
      ));
  
}
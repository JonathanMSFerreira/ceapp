


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CeAppPage.dart';

class NewCePage extends StatefulWidget {
  @override
  _NewCePageState createState() => _NewCePageState();
}

class _NewCePageState extends State<NewCePage> {
  DateTime date1;
  DateTime date2;
  DateTime date3;

  @override
  Widget build(BuildContext context) {


    bool manha = false;
    bool tarde = false;
    bool noite = false;
    bool sabado = false;
    bool domingo = false;
    bool segunda = false;
    bool terca = false;
    bool quarta = false;
    bool quinta = false;
    bool sexta = false;


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Novo Ciclo de Estudos"),
        ),


        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [




                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Nome do ciclo'),
                        ),
                        TextFormField(
                          decoration:
                          InputDecoration(labelText: 'Início do ciclo'),
                        ),
                        TextFormField(
                          decoration:
                          InputDecoration(labelText: 'Fim do ciclo'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text(
                            "Dias da semana",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 20.0),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[



                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Segunda"),
                                Checkbox(
                                  value: manha,
                                  onChanged: (bool value) {
                                    setState(() {
                                      manha = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Terça"),
                                Checkbox(
                                  value: tarde,
                                  onChanged: (bool value) {
                                    setState(() {
                                      tarde = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Quarta"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Quinta"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Sexta"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Sábado"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Domingo"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),



                        Divider(),

                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Horários",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 20.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // [Monday] checkbox
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Manhã"),
                                Checkbox(
                                  value: manha,
                                  onChanged: (bool value) {
                                    setState(() {
                                      manha = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            // [Tuesday] checkbox
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Tarde"),
                                Checkbox(
                                  value: tarde,
                                  onChanged: (bool value) {
                                    setState(() {
                                      tarde = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            // [Wednesday] checkbox
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Noite"),
                                Checkbox(
                                  value: noite,
                                  onChanged: (bool value) {
                                    setState(() {
                                      noite = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        RaisedButton(
                          color: Colors.deepPurple,

                          child: new Text(
                            "Novo ciclo",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.0),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new CeAppPage()));
                          },
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]))),
        ));
  }
}
